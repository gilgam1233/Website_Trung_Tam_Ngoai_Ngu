import random
from faker import Faker
from datetime import datetime, timedelta

# Cấu hình Faker tiếng Việt
fake = Faker('vi_VN')
Faker.seed(0)  # Để dữ liệu giống nhau mỗi lần chạy

# File output
f = open("insert_data.sql", "w", encoding="utf-8")


def write_sql(sql):
    f.write(sql + "\n")


print("Đang tạo dữ liệu... Vui lòng chờ...")

# ==========================================
# 1. TẠO USER (Single Table Inheritance)
# ==========================================
# Khởi tạo các danh sách để chứa ID theo vai trò
admin_ids = []
teacher_ids = []
cashier_ids = []
student_ids = []

phones = set()


# Hàm tạo số điện thoại VN unique
def get_unique_phone():
    while True:
        p = "09" + "".join([str(random.randint(0, 9)) for _ in range(8)])
        if p not in phones:
            phones.add(p)
            return p


# Định nghĩa số lượng từng vai trò
roles = ['Admin'] * 1 + ['Teacher'] * 15 + ['Cashier'] * 10 + ['Student'] * 120
random.shuffle(roles)  # Trộn ngẫu nhiên thứ tự tạo

write_sql("-- 1. INSERT USERS (With 'type' column for Inheritance)")

for i, role in enumerate(roles):
    uid = f"{i + 1:07d}"  # U001, U002...

    if role == 'Admin':
        uid = "100" + uid
        admin_ids.append(uid)
    elif role == 'Teacher':
        uid = "101" + uid
        teacher_ids.append(uid)
    elif role == 'Cashier':
        uid = "102" + uid
        cashier_ids.append(uid)
    elif role == 'Student':
        uid = "103" + uid
        student_ids.append(uid)

    name = fake.name()
    email = f"{uid}@center.com"
    gender = random.choice([0, 1])
    phone = get_unique_phone()

    # Logic ngày sinh
    if role == 'Student':
        dob = fake.date_of_birth(minimum_age=6, maximum_age=25).strftime('%Y-%m-%d')
    else:
        dob = fake.date_of_birth(minimum_age=22, maximum_age=55).strftime('%Y-%m-%d')

    address = fake.address().replace("\n", ", ").replace("'", "")
    username = f"{uid}"
    password = "123"

    # [QUAN TRỌNG] Thêm cột `type` với giá trị lowercase (admin, student, teacher...)
    # Giá trị này phải khớp với 'polymorphic_identity' trong model SQLAlchemy
    user_type = role.lower()

    sql = f"INSERT INTO `user` (`id`, `fullname`, `email`, `gender`, `phone_number`, `dob`, `address`, `username`, `password`, `status`, `type`) VALUES ('{uid}', '{name}', '{email}', {gender}, '{phone}', '{dob}', '{address}', '{username}', '{password}', 1, '{user_type}');"
    write_sql(sql)

# ==========================================
# 3. TẠO KHÓA HỌC (COURSE) - 20 Khóa
# ==========================================
write_sql("\n-- 3. INSERT COURSES")
course_ids = []
levels = ['BEGINNER', 'INTERMEDIATE', 'ADVANCED']
ages = ['KIDS', 'TEEN', 'ADULT']
course_names = ["Tiếng Anh Giao Tiếp", "IELTS Foundation", "IELTS Intensive", "TOEIC Basic", "Tiếng Anh Trẻ Em",
                "Business English", "English for IT"]

for i in range(1, 21):  # Tạo 20 khóa
    cid = f"C{i:03d}"
    course_ids.append(cid)
    cname = f"{random.choice(course_names)} - Level {i}"
    fee = random.choice([1000000, 2500000, 5000000, 3000000])
    age = random.choice(ages)
    level = random.choice(levels)
    duration = random.choice([24, 36, 48, 72])
    desc = "Khóa học chất lượng cao"

    write_sql(
        f"INSERT INTO `course` (`id`, `name`, `fee`, `age`, `level`, `duration_hour`, `course_description`) VALUES ('{cid}', '{cname}', {fee}, '{age}', '{level}', '{duration}', '{desc}');")

# ==========================================
# 4. TẠO CẤU PHẦN ĐIỂM (GRADE COMPONENT)
# ==========================================
write_sql("\n-- 4. INSERT GRADE COMPONENTS")
grade_comp_ids = []
gc_counter = 1

for cid in course_ids:
    # Mỗi khóa có 2 cột điểm: Giữa kỳ (40%) và Cuối kỳ (60%)
    write_sql(f"INSERT INTO `grade_component` (`name`, `weight`, `course_id`) VALUES ('Mid-term', 0.4, '{cid}');")
    grade_comp_ids.append({'id': gc_counter, 'course_id': cid})
    gc_counter += 1

    write_sql(f"INSERT INTO `grade_component` (`name`, `weight`, `course_id`) VALUES ('Final-term', 0.6, '{cid}');")
    grade_comp_ids.append({'id': gc_counter, 'course_id': cid})
    gc_counter += 1

# ==========================================
# 5. TẠO LỚP HỌC (CLASSROOM) - 50 Lớp
# ==========================================
write_sql("\n-- 5. INSERT CLASSROOMS")
class_ids = []
for i in range(1, 51):
    clid = f"CL{i:03d}"
    class_ids.append({'id': clid, 'course_id': random.choice(course_ids)})

    course_ref = class_ids[-1]['course_id']
    name = f"Lớp {course_ref}-{i}"
    start = fake.date_between(start_date='-1y', end_date='today')
    end = start + timedelta(days=90)
    max_stu = random.randint(10, 30)

    # [SỬA ĐỔI] Chỉ lấy random từ danh sách teacher_ids
    if not teacher_ids:
        print("Lỗi: Không có giáo viên nào được tạo!")
        break
    tid = random.choice(teacher_ids)

    write_sql(
        f"INSERT INTO `classroom` (`id`, `name`, `start_date`, `end_date`, `max_student`, `teacher_id`, `course_id`) VALUES ('{clid}', '{name}', '{start}', '{end}', {max_stu}, '{tid}', '{course_ref}');")

# ==========================================
# 6. TẠO LỊCH HỌC (SCHEDULE DETAIL)
# ==========================================
write_sql("\n-- 6. INSERT SCHEDULE DETAILS")
days = ['MONDAY', 'TUESDAY', 'WEDNESDAY', 'THURSDAY', 'FRIDAY', 'SATURDAY', 'SUNDAY']
for cl in class_ids:
    class_days = random.sample(days, 2)
    for d in class_days:
        write_sql(
            f"INSERT INTO `schedule_detail` (`day`, `start_time`, `end_time`, `class_id`) VALUES ('{d}', '18:00:00', '19:30:00', '{cl['id']}');")

# ==========================================
# 7. TẠO ĐĂNG KÝ (ENROLLMENT)
# ==========================================
write_sql("\n-- 7. INSERT ENROLLMENTS")
enrollment_ids = []
enroll_counter = 1

# [SỬA ĐỔI] Chỉ duyệt qua danh sách student_ids
for stu_id in student_ids:
    num_classes = random.randint(1, 2)
    chosen_classes = random.sample(class_ids, num_classes)

    for cls in chosen_classes:
        status = random.choice(['APPROVED', 'PENDING', 'REJECTED'])
        reg_date = fake.date_between(start_date='-1y', end_date='today')

        write_sql(
            f"INSERT INTO `enrollment` (`register_date`, `status`, `student_id`, `class_id`) VALUES ('{reg_date}', '{status}', '{stu_id}', '{cls['id']}');")

        if status == 'APPROVED':
            enrollment_ids.append(
                {'id': enroll_counter, 'student_id': stu_id, 'class_id': cls['id'], 'course_id': cls['course_id']})

        enroll_counter += 1

# ==========================================
# 8. TẠO HÓA ĐƠN (BILL)
# ==========================================
write_sql("\n-- 8. INSERT BILLS")
for enroll in enrollment_ids:
    status = 'PAID' if random.random() > 0.2 else 'UNPAID'

    # [SỬA ĐỔI] Chỉ lấy random từ danh sách cashier_ids
    if not cashier_ids:
        cashier = 'NULL'  # Fallback nếu không có cashier
    else:
        cashier = random.choice(cashier_ids)

    create_date = fake.date_time_between(start_date='-1y', end_date='now')

    write_sql(
        f"INSERT INTO `bill` (`create_date`, `status`, `enrollment_id`, `cashier_id`) VALUES ('{create_date}', '{status}', {enroll['id']}, '{cashier}');")

# ==========================================
# 9. TẠO ĐIỂM SỐ (SCORE)
# ==========================================
write_sql("\n-- 9. INSERT SCORES")
for enroll in enrollment_ids:
    comps = [gc for gc in grade_comp_ids if gc['course_id'] == enroll['course_id']]

    for c in comps:
        score = round(random.uniform(5.0, 10.0), 1)
        write_sql(
            f"INSERT INTO `score` (`score`, `enrollment_id`, `grade_id`) VALUES ({score}, {enroll['id']}, {c['id']});")

f.close()
print(
    f"Xong! File 'insert_data.sql' đã được tạo với {len(roles)} users ({len(student_ids)} Students, {len(teacher_ids)} Teachers).")
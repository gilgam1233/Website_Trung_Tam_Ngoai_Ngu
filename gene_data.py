import random
from faker import Faker
from datetime import datetime, timedelta

# Cấu hình Faker tiếng Việt
fake = Faker('vi_VN')
Faker.seed(0)

# File output
f = open("insert_data.sql", "w", encoding="utf-8")


def write_sql(sql):
    f.write(sql + "\n")


print("Đang tạo dữ liệu... Vui lòng chờ...")

# ==========================================
# 1. TẠO USER & CÁC BẢNG KẾ THỪA
# ==========================================
# Khởi tạo danh sách ID
admin_ids = []
teacher_ids = []
cashier_ids = []
student_ids = []

phones = set()


def get_unique_phone():
    while True:
        p = "09" + "".join([str(random.randint(0, 9)) for _ in range(8)])
        if p not in phones:
            phones.add(p)
            return p


# Định nghĩa số lượng
roles = ['Admin'] * 2 + ['Teacher'] * 15 + ['Cashier'] * 10 + ['Student'] * 120
random.shuffle(roles)

write_sql("-- 1. INSERT USERS & JOINED TABLES (Student, Employee, Teacher, Cashier, Admin)")

for i, role in enumerate(roles):
    # --- LOGIC TẠO ID (GIỮ NGUYÊN) ---
    uid = f"{i + 1:07d}"
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

    # --- DỮ LIỆU CHUNG (BẢNG USER) ---
    name = fake.name()
    email = f"{uid}@center.com"
    gender = random.choice([0, 1])
    phone = get_unique_phone()

    if role == 'Student':
        dob = fake.date_of_birth(minimum_age=6, maximum_age=25).strftime('%Y-%m-%d')
    else:
        dob = fake.date_of_birth(minimum_age=22, maximum_age=55).strftime('%Y-%m-%d')

    address = fake.address().replace("\n", ", ").replace("'", "")
    username = f"{uid}"
    password = "123"  # Nên hash password nếu chạy thật, ở đây để raw cho test

    # Polymorphic identity phải khớp với model
    user_type = role.lower()

    # INSERT VÀO BẢNG CHA: USER
    sql_user = f"INSERT INTO `user` (`id`, `name`, `email`, `gender`, `phone_number`, `dob`, `address`, `username`, `password`, `status`, `type`) VALUES ('{uid}', '{name}', '{email}', {gender}, '{phone}', '{dob}', '{address}', '{username}', '{password}', 1, '{user_type}');"
    write_sql(sql_user)

    # --- XỬ LÝ DỮ LIỆU CÁC BẢNG CON ---

    # 1. NHÁNH HỌC VIÊN
    if role == 'Student':
        emergency = get_unique_phone()
        sql_student = f"INSERT INTO `student` (`id`, `emergency_contact`) VALUES ('{uid}', '{emergency}');"
        write_sql(sql_student)

    # 2. NHÁNH NHÂN VIÊN (Employee) - Dùng chung cho Admin, Teacher, Cashier
    else:
        salary = random.choice([8000000, 12000000, 15000000, 20000000])
        hired_date = fake.date_between(start_date='-5y', end_date='today')

        # Insert vào bảng trung gian EMPLOYEE trước
        sql_employee = f"INSERT INTO `employee` (`id`, `salary`, `hired_date`) VALUES ('{uid}', {salary}, '{hired_date}');"
        write_sql(sql_employee)

        # 3. NHÁNH CON CỦA EMPLOYEE
        if role == 'Teacher':
            major = random.choice(['Sư phạm Anh', 'Ngôn ngữ Anh', 'TESOL', 'Linguistics'])
            degree = random.choice(['Cử nhân', 'Thạc sĩ', 'Chứng chỉ quốc tế'])
            sql_teacher = f"INSERT INTO `teacher` (`id`, `major`, `degree`) VALUES ('{uid}', '{major}', '{degree}');"
            write_sql(sql_teacher)

        elif role == 'Cashier':
            shift = random.choice(['Sáng (7h-12h)', 'Chiều (13h-17h)', 'Tối (17h-21h)'])
            sql_cashier = f"INSERT INTO `cashier` (`id`, `shift`) VALUES ('{uid}', '{shift}');"
            write_sql(sql_cashier)

        elif role == 'Admin':
            access_level = 1  # Quản lý
            report_email = email
            sql_admin = f"INSERT INTO `admin` (`id`, `access_level`, `report_email`) VALUES ('{uid}', {access_level}, '{report_email}');"
            write_sql(sql_admin)

# ==========================================
# 3. TẠO KHÓA HỌC (COURSE)
# ==========================================
write_sql("\n-- 3. INSERT COURSES")
course_ids = []
course_fees = {}  # <--- THÊM BIẾN NÀY ĐỂ TRA CỨU GIÁ

levels = ['BEGINNER', 'INTERMEDIATE', 'ADVANCED']
ages = ['KIDS', 'TEEN', 'ADULT']
course_names = ["Tiếng Anh Giao Tiếp", "IELTS Foundation", "IELTS Intensive", "TOEIC Basic", "Tiếng Anh Trẻ Em",
                "Business English", "English for IT"]

for i in range(1, 21):
    cid = f"C{i:03d}"
    course_ids.append(cid)
    base_name = random.choice(course_names)
    cname = f"{base_name} - {i}"

    fee = random.choice([1000000, 2500000, 5000000, 3000000])
    course_fees[cid] = fee  # <--- LƯU GIÁ TIỀN VÀO DICT

    age = random.choice(ages)
    level = random.choice(levels)
    duration = random.choice(['24h', '36h', '48h', '72h'])
    desc = "Khóa học chất lượng cao"

    write_sql(
        f"INSERT INTO `course` (`id`, `name`, `fee`, `age`, `level`, `duration_hour`, `course_description`) VALUES ('{cid}', '{cname}', {fee}, '{age}', '{level}', '{duration}', '{desc}');")

# ==========================================
# 4. TẠO CẤU PHẦN ĐIỂM (GRADE COMPONENT)
# ==========================================
write_sql("\n-- 4. INSERT GRADE COMPONENTS")
grade_comp_ids = []
# Reset counter nếu cần, ở đây giả sử auto inc bắt đầu từ 1
gc_counter = 1

for cid in course_ids:
    write_sql(f"INSERT INTO `grade_component` (`name`, `weight`, `course_id`) VALUES ('Mid-term', 0.4, '{cid}');")
    grade_comp_ids.append({'id': gc_counter, 'course_id': cid})
    gc_counter += 1

    write_sql(f"INSERT INTO `grade_component` (`name`, `weight`, `course_id`) VALUES ('Final-term', 0.6, '{cid}');")
    grade_comp_ids.append({'id': gc_counter, 'course_id': cid})
    gc_counter += 1

# ==========================================
# 5. TẠO LỚP HỌC (CLASSROOM)
# ==========================================
write_sql("\n-- 5. INSERT CLASSROOMS")
class_ids = []
for i in range(1, 51):
    clid = f"CL{i:03d}"
    course_ref = random.choice(course_ids)
    class_ids.append({'id': clid, 'course_id': course_ref})

    name = f"Lớp {course_ref}-{i}"
    start = fake.date_between(start_date='-1y', end_date='today')
    end = start + timedelta(days=90)
    max_stu = random.randint(10, 30)

    if not teacher_ids:
        print("Lỗi: Không có giáo viên!")
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
    class_days = random.sample(days, 2)  # Học 2 buổi/tuần
    for d in class_days:
        write_sql(
            f"INSERT INTO `schedule_detail` (`day`, `start_time`, `end_time`, `class_id`) VALUES ('{d}', '18:00:00', '19:30:00', '{cl['id']}');")

# ==========================================
# 7. TẠO ĐĂNG KÝ (ENROLLMENT)
# ==========================================
write_sql("\n-- 7. INSERT ENROLLMENTS")
enrollment_ids = []
enroll_counter = 1

for stu_id in student_ids:
    num_classes = random.randint(1, 2)
    chosen_classes = random.sample(class_ids, num_classes)

    for cls in chosen_classes:
        status = random.choice(['APPROVED', 'PENDING', 'REJECTED'])
        reg_date = fake.date_between(start_date='-1y', end_date='today')

        write_sql(
            f"INSERT INTO `enrollment` (`register_date`, `status`, `student_id`, `class_id`) VALUES ('{reg_date}', '{status}', '{stu_id}', '{cls['id']}');")

        if status == 'APPROVED':
            # Lưu lại để tạo Bill và Score
            enrollment_ids.append(
                {'id': enroll_counter, 'student_id': stu_id, 'class_id': cls['id'], 'course_id': cls['course_id']})

        enroll_counter += 1

# ==========================================
# 8. TẠO HÓA ĐƠN (BILL)
# ==========================================
write_sql("\n-- 8. INSERT BILLS")
for enroll in enrollment_ids:
    status = 'PAID' if random.random() > 0.2 else 'UNPAID'

    if not cashier_ids:
        # Nếu không có cashier thì không thể tạo bill vì cashier_id nullable=False
        # Hoặc bạn phải hardcode 1 id giả, hoặc break
        print("Cảnh báo: Không có Cashier để tạo Bill")
        break

    cashier = random.choice(cashier_ids)
    create_date = fake.date_time_between(start_date='-1y', end_date='now')

    # Lấy giá tiền tương ứng với khóa học của lần đăng ký này
    # enroll['course_id'] đã được bạn lưu ở Section 7
    price = course_fees.get(enroll['course_id'], 0)

    # Thêm cột unit_price vào câu lệnh SQL
    write_sql(
        f"INSERT INTO `bill` (`create_date`, `status`, `enrollment_id`, `cashier_id`, `unit_price`) VALUES ('{create_date}', '{status}', {enroll['id']}, '{cashier}', {price});")
# ==========================================
# 9. TẠO ĐIỂM SỐ (SCORE)
# ==========================================
write_sql("\n-- 9. INSERT SCORES")
for enroll in enrollment_ids:
    # Lấy các đầu điểm thuộc khóa học mà học viên đăng ký
    comps = [gc for gc in grade_comp_ids if gc['course_id'] == enroll['course_id']]

    for c in comps:
        score = round(random.uniform(5.0, 10.0), 1)
        write_sql(
            f"INSERT INTO `score` (`score`, `enrollment_id`, `grade_id`) VALUES ({score}, {enroll['id']}, {c['id']});")

# ==========================================
# 10. TẠO ĐIỂM DANH (ATTENDANCE) - Bổ sung thêm cho đủ model
# ==========================================
write_sql("\n-- 10. INSERT ATTENDANCE")
for enroll in enrollment_ids:
    # Random điểm danh 1 vài buổi
    for _ in range(2):
        att_date = fake.date_between(start_date='-1m', end_date='today')
        status = random.choice(['PRESENT', 'ABSENT'])
        note = "Vắng không phép" if status == 'ABSENT' else ""
        write_sql(
            f"INSERT INTO `attendance` (`date`, `status`, `note`, `enrollment_id`) VALUES ('{att_date}', '{status}', '{note}', {enroll['id']});")

f.close()
print(f"Xong! Dữ liệu đã được tạo cho {len(roles)} users với cấu trúc Joined Table Inheritance.")
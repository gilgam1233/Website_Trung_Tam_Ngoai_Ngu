import enum
from datetime import datetime
from sqlalchemy import Column, Integer, String, DateTime, Date, Enum, ForeignKey, Time
from sqlalchemy.dialects.mysql import DECIMAL, DOUBLE
from sqlalchemy.dialects.mssql import TINYINT
from EngCenter import app, db


# --- 1. Sửa lớp User (Base) ---
class User(db.Model):
    __tablename__ = 'user'  # Đặt tên bảng rõ ràng

    id = Column(String(10), primary_key=True)
    fullname = Column(String(250), nullable=False)
    email = Column(String(100), nullable=False)
    gender = Column(Integer, nullable=False, default=0)
    phone_number = Column(String(10), unique=True)
    dob = Column(Date, nullable=False)
    address = Column(String(250))
    username = Column(String(30), nullable=False, unique=True)
    password = Column(String(30), nullable=False)
    status = Column(TINYINT, default=1)

    type = Column(String(20))

    __mapper_args__ = {
        'polymorphic_identity': 'user',
        'polymorphic_on': type
    }

class Admin(User):
    __mapper_args__ = {
        'polymorphic_identity': 'admin'
    }


class Student(User):
    __mapper_args__ = {
        'polymorphic_identity': 'student'
    }


class Teacher(User):
    __mapper_args__ = {
        'polymorphic_identity': 'teacher'
    }


class Cashier(User):
    __mapper_args__ = {
        'polymorphic_identity': 'cashier'
    }


class AgeEnum(enum.Enum):
    KIDS = 0
    TEEN = 1
    ADULT = 2


class SkillEnum(enum.Enum):
    BEGINNER = 0
    INTERMEDIATE = 1
    ADVANCED = 2


class DayOfWeek(enum.Enum):
    MONDAY = 0
    TUESDAY = 1
    WEDNESDAY = 2
    THURSDAY = 3
    FRIDAY = 4
    SATURDAY = 5
    SUNDAY = 6


class EnrollEnum(enum.Enum):
    PENDING = 0
    APPROVED = 1
    REJECTED = 2


class BillEnum(enum.Enum):
    UNPAID = 0
    PAID = 1


class Course(db.Model):
    id = Column(String(10), primary_key=True)
    name = Column(String(100), nullable=False)
    fee = Column(DECIMAL(10, 2), nullable=False)
    age = Column(Enum(AgeEnum), nullable=False)
    level = Column(Enum(SkillEnum), nullable=False)
    duration_hour = Column(String(10), nullable=False)
    course_description = Column(String(250))


class Classroom(db.Model):
    id = Column(String(10), primary_key=True)
    name = Column(String(100), nullable=False)
    start_date = Column(Date, nullable=False)
    end_date = Column(Date, nullable=False)
    max_student = Column(Integer, nullable=False)

    teacher_id = Column(String(10), ForeignKey('user.id'), nullable=False)
    course_id = Column(String(10), ForeignKey(Course.id), nullable=False)

class ScheduleDetail(db.Model):
    id = Column(Integer, primary_key=True, autoincrement=True)
    day = Column(Enum(DayOfWeek), nullable=False)
    start_time = Column(Time, nullable=False)
    end_time = Column(Time, nullable=False)
    class_id = Column(String(10), ForeignKey(Classroom.id), nullable=False)


class GradeComponent(db.Model):
    id = Column(Integer, autoincrement=True, primary_key=True)
    name = Column(String(50), nullable=False)
    weight = Column(DOUBLE, nullable=False)
    course_id = Column(String(10), ForeignKey(Course.id), nullable=False)


class Enrollment(db.Model):
    id = Column(Integer, autoincrement=True, primary_key=True)
    register_date = Column(Date, nullable=False, default=datetime.now)
    status = Column(Enum(EnrollEnum), nullable=False)

    student_id = Column(String(10), ForeignKey('user.id'), nullable=False)
    class_id = Column(String(10), ForeignKey(Classroom.id), nullable=False)


class Score(db.Model):
    id = Column(Integer, primary_key=True, autoincrement=True)
    score = Column(DOUBLE, nullable=False)
    enrollment_id = Column(Integer, ForeignKey(Enrollment.id), nullable=False)
    grade_id = Column(Integer, ForeignKey(GradeComponent.id), nullable=False)


class Bill(db.Model):
    id = Column(Integer, primary_key=True, autoincrement=True)
    create_date = Column(DateTime, nullable=False, default=datetime.now)
    status = Column(Enum(BillEnum), nullable=False)
    enrollment_id = Column(Integer, ForeignKey(Enrollment.id), nullable=False)

    cashier_id = Column(String(10), ForeignKey('user.id'), nullable=False)


if __name__ == '__main__':
    with app.app_context():
        # Lưu ý: Nếu database cũ đã có dữ liệu, bạn cần drop tables cũ hoặc migrate
        db.drop_all()
        db.create_all()
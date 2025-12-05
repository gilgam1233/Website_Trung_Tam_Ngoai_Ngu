from EngCenter.models.models import Classroom,Course,Enrollment,Teacher,GradeComponent
from datetime import date
import re

def getGradeByCourseID(course_id):
    return GradeComponent.query.filter_by(course_id=course_id).all()

def getTeacherByID(id):
    return Teacher.query.get(id)

def getClassroomByID(id):
    return Classroom.query.get(id)

def getStudentByClassID(id):
    return Enrollment.query.filter_by(class_id=id).all()

def getClassByTeacherID(id):
    return Classroom.query.filter_by(teacher_id=id).all()

def getCoursesByID(id):
    return Course.query.get(id)

def getTodayClass(classroom):
    days = ['2', '3', '4', '5', '6', '7', 'CN']
    today_str = days[date.today().weekday()]
    regax = r"\b" + today_str + r"\b"

    return [c for c in classroom if re.search(regax, c.schedules_display)]
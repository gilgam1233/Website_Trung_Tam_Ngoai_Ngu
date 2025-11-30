from EngCenter.models.models import Classroom,Course,Enrollment,Teacher


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
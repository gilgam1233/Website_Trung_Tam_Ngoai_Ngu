from flask import Blueprint, render_template
from EngCenter.services import teacher_service
teacher_bp = Blueprint('teacher_bp', __name__, template_folder='../templates/teacher')

@teacher_bp.route('/')
def home():
    teacher = teacher_service.getTeacherByID('1010000001')
    classroom = teacher_service.getClassByTeacherID('1010000001')
    return render_template('index.html',teacher = teacher,classroom = classroom)

@teacher_bp.route('/LopGiangDay/<class_id>/DanhSachHocVien')
def class_XemDanhSach(class_id):
    current_class = teacher_service.getClassroomByID(class_id)
    enrollments = teacher_service.getStudentByClassID(class_id)
    student = [e.student for e in enrollments]
    return render_template('DanhSachHocVien.html', student = student,
                          current_class = current_class)

@teacher_bp.route('/LopGiangDay/<class_id>/NhapDiem')
def class_NhapDiem(class_id):
    current_class = teacher_service.getClassroomByID(class_id)
    enrollments = teacher_service.getStudentByClassID(class_id)
    student = [e.student for e in enrollments]
    return render_template('NhapDiem.html', student = student,current_class = current_class)

@teacher_bp.route('/LopGiangDay')
def class_LopGiangDay():
    classroom = teacher_service.getClassByTeacherID('1010000001')

    return render_template('QuanLyLopHoc.html', classroom = classroom)
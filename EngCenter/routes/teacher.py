from datetime import date
from flask import Blueprint, render_template, redirect, url_for, request, jsonify
import re

from EngCenter import db
from EngCenter.models.models import Score,Attendance
from EngCenter.services import teacher_service

teacher_bp = Blueprint('teacher_bp', __name__, template_folder='../templates/teacher')


@teacher_bp.route('/')
def home():

    teacher = teacher_service.getTeacherByID('1010000032')
    classroom = teacher_service.getClassByTeacherID('1010000032')

    class_today = teacher_service.getTodayClass(classroom)
    return render_template('index.html', teacher=teacher, classroom=class_today,size=len(class_today))


@teacher_bp.route('/LopGiangDay/<class_id>/DanhSachHocVien')
def class_XemDanhSach(class_id):
    current_class = teacher_service.getClassroomByID(class_id)
    enrollments = teacher_service.getStudentByClassID(class_id)
    return render_template('DanhSachHocVien.html', enrollments=enrollments,
                           current_class=current_class)


@teacher_bp.route('/LopGiangDay/<class_id>/NhapDiem')
def class_NhapDiem(class_id):
    current_class = teacher_service.getClassroomByID(class_id)
    enrollments = teacher_service.getStudentByClassID(class_id)
    grade_component = teacher_service.getGradeByCourseID(current_class.course_id)
    return render_template('NhapDiem.html', enrollments=enrollments, current_class=current_class,
                           grade_component=grade_component)


@teacher_bp.route('/LopGiangDay/<class_id>/NhapDiem/save', methods=['POST'])
def class_save_nhap_diem(class_id):
    try:
        data = request.get_json()
        # print(len(data))
        # if (data):
        #     print(data)

        for item in data:
            scores = item["scores"]
            enroll_id = item["enrollment_id"]

            for score in scores:
                grade_id = score["grade_id"]
                score_val = score["score"]

                if(score_val == None):
                    score_val = 0
                exist_score = Score.query.filter_by(grade_id=grade_id, enrollment_id=enroll_id).first()

                if (exist_score):
                    exist_score.score = score_val
                else:
                    new_score = Score(grade_id=grade_id, enrollment_id=enroll_id, score=score_val)
                    db.session.add(new_score)
        db.session.commit()

        return jsonify({'success': True, 'message': 'Đã lưu thành công'})
    except Exception as ex:
        return jsonify({'succes': False, 'message': str(ex)}),500


@teacher_bp.route('/LopGiangDay/<class_id>/DiemDanh')
def class_DiemDanh(class_id):
    current_class = teacher_service.getClassroomByID(class_id)
    enrollments = teacher_service.getStudentByClassID(class_id)
    return render_template('DiemDanh.html', enrollments=enrollments, current_class=current_class)


@teacher_bp.route('/LopGiangDay/<class_id>/DiemDanh/save', methods=['POST'])
def class_save_diem_danh(class_id):
    try:
        data = request.get_json()
        my_date = data.get("date")
        my_attend = data.get("attend_data")
        # print(my_date)
        for attend in my_attend:
            enrollment_id = attend["enrollment_id"]
            status = attend["status"]
            note = attend["note"]

            exist_attend = Attendance.query.filter_by(enrollment_id=enrollment_id).first()

            if(exist_attend):
                exist_attend.status = status
                exist_attend.note = note
            else:
                attend_date = Attendance(status=status, note=note, enrollment_id=enrollment_id,date=my_date['date'])
                db.session.add(attend_date)

        db.session.commit()

        return jsonify({'success': True, 'message': 'Đã lưu thành công'})
    except Exception as ex:
        return jsonify({'success': False, 'message': str(ex)}),500

@teacher_bp.route('/LopGiangDay')
def class_LopGiangDay():
    classroom = teacher_service.getClassByTeacherID('1010000032')

    return render_template('QuanLyLopHoc.html', classroom=classroom)

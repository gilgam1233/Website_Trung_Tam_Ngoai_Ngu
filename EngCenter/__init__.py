from flask import Flask
from flask_sqlalchemy import SQLAlchemy
import cloudinary

cloudinary.config(
    cloud_name = "du9oap5y2",
    api_key = "492138323811485",
    api_secret = "Er5JxBpRBZV90FD9Pfd9PmK2RHg"
)
app = Flask(__name__)

app.config["SQLALCHEMY_DATABASE_URI"] = "mysql+pymysql://root:123456@localhost/engdb?charset=utf8mb4"
app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = True


db = SQLAlchemy(app)


from EngCenter.routes.main_routes import main_bp
from EngCenter.routes.teacher import teacher_bp

# app.register_blueprint(main_bp)

app.register_blueprint(teacher_bp)

@app.template_filter('get_score')
def get_score_filter(scores, grade_name):
    if not scores:
        return ""
    for s in scores:
        if s.grade_component.name == grade_name:
            return "{:.2f}".format(s.score)
    return ""

@app.template_filter('calculate_total')
def calculate_total_filter(scores):
    total = 0
    if not scores: return 0
    for s in scores:
        total += s.score * s.grade_component.weight
    return round(total, 2)
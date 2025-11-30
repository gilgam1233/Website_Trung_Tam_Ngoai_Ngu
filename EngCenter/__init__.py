from flask import Flask
from flask_sqlalchemy import SQLAlchemy
app = Flask(__name__)

app.config["SQLALCHEMY_DATABASE_URI"] = "mysql+pymysql://root:123456@localhost/engdb?charset=utf8mb4"
app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = True


db = SQLAlchemy(app)


from EngCenter.routes.main_routes import main_bp
from EngCenter.routes.teacher import teacher_bp

# app.register_blueprint(main_bp)

app.register_blueprint(teacher_bp)

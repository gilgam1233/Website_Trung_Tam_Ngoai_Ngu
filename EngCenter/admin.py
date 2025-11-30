from flask_admin.contrib.sqla import ModelView
from flask_admin import Admin, AdminIndexView, expose
from flask_admin.theme import Bootstrap4Theme
from EngCenter import db, app
from EngCenter.models.models import Course

class MyAdminIndexView(AdminIndexView):
    @expose("/")
    def index(self):
        return self.render('admin/index.html')




admin = Admin(app=app, name="E-COMMERCE", theme=Bootstrap4Theme())

admin.add_view(ModelView(Course, db.session))

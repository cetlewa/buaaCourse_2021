import json
from flask import Flask, request
from DataBase.mysql import session
from DataBase.models.Student import Student
from DataBase.models.Course import Course
from DataBase.models.Comment import Comment
from DataBase.models.Teacher import Teacher
from DataBase.models.CosTea import CosTea
from DataBase.models.StuComCos import StuComCos
from DataBase.models.StuComTea import StuComTea

# 配置
app = Flask(__name__)
app.config.from_object(__name__)

# WrongPassword   400
# NotRegistered   401
# UserIdRepeat    402
# UserTypeError   403
# RequestError    404
# CourseNotFound  405

@app.route('/')
def hello_world():  # put application's code here
    return 'Hello World!'

@app.route('/test', methods=['POST', 'GET'])
def test():
    if request.method == 'GET':
        ans = []
        ans.append({
            "uri": "https://img2.baidu.com/it/u=664480440,434651995&fm=26&fmt=auto",
            "title": "猪",
            "author": "朱祖坤",
            "body": "猪猪猪猪猪猪猪猪猪猪猪猪",
            "time": "12/4"
        })
        ans.append({
            "uri": "https://img1.baidu.com/it/u=58880611,2520214730&fm=26&fmt=auto",
            "title": "大猪",
            "author": "猪祖坤",
            "body": "猪头猪",
            "time": "12/2"
        })
        return json.dumps(ans, ensure_ascii=False)

@app.route('/queryCourseComments', methods=['POST', 'GET'])
def queryCourseComments():
    if request.method == 'POST':
        postForm = json.loads(request.get_data(as_text=True))
        cosId = postForm['courseId']
        if session.query(Course).filter(Course.cosId == cosId).all():
            ans = []
            cosComList = session.query(StuComCos).filter(StuComCos.cosId == cosId).all()
            for i in cosComList:
                ans.append({
                    'userId': i.stuId,
                    'userName': session.query(Student.stuName).filter(Student.stuId == i.stuId).first()[0],
                    'commentScore': session.query(Comment.comScore).filter(Comment.comId == i.comId).first()[0],
                    'commentText': session.query(Comment.comText).filter(Comment.comId == i.comId).first()[0]
                })
            print(ans)
            return json.dumps(ans, ensure_ascii=False)
        else:
            return "CourseNotFound", 405
    else:
        return "RequestError", 404

@app.route('/queryAllCourse', methods=['POST', 'GET'])
def queryAllCourse():
    if request.method == 'GET':
        ans = []
        courseList = session.query(Course).all()
        for i in courseList:
            ans.append({
                    'courseId': i.cosId,
                    'courseName': i.cosName,
                    'courseAttribute': i.cosAttribute,
                    'courseLocation': i.cosLocation,
                    'courseTeacher': i.cosTeacher,
                    'courseType': i.cosType,
                    'courseSchool': i.cosSchool,
                    'coursePoint': i.cosPoint,
                    'courseSelected': i.cosSelected,
                    'courseCapacity': i.cosCapacity,
                    'courseIntroduction': i.cosIntro
                })
        return json.dumps(ans, ensure_ascii=False)
    else:
        return "RequestError", 404

@app.route('/login', methods=['POST', 'GET'])
def login():
    if request.method == 'POST':
        postForm = json.loads(request.get_data(as_text=True))
        userId = postForm['userId']
        userPwd = postForm['userPwd']
        if session.query(Student).filter(Student.stuId == userId).all():
            ans = session.query(Student.stuPwd).filter(Student.stuId == userId).first()
            if ans[0] == userPwd:
                return json.dumps({
                    'success': True,
                    'userType': "student"
                }, ensure_ascii=False)
            else:
                return "WrongPassword", 400
        elif session.query(Teacher).filter(Teacher.teaId == userId).all():
            ans = session.query(Teacher.teaId).filter(Teacher.teaId == userId).first()
            if ans[0] == userPwd:
                return json.dumps({
                    'success': True,
                    'userType': "teacher"
                }, ensure_ascii=False)
            else:
                return "WrongPassword", 400
        else:
            return "NotRegistered", 401
    else:
        return "RequestError", 404

@app.route('/register', methods=['POST', 'GET'])
def register():
    if request.method == 'POST':
        postForm = json.loads(request.get_data(as_text=True))
        userId = postForm['userId']
        userPwd = postForm['userPwd']
        userType = postForm['userType']
        userName = postForm['userName'] if 'userName' in postForm else ""
        userGender = postForm['userGender'] if 'userGender' in postForm else ""
        userGrade = postForm['userGrade'] if 'userGrade' in postForm else ""
        userLocation = postForm['userLocation'] if 'userLocation' in postForm else ""
        userMail = postForm['userMail'] if 'userMail' in postForm else ""
        userTel = postForm['userTel'] if 'userTel' in postForm else ""
        userSchool = postForm['userSchool'] if 'userSchool' in postForm else ""
        userTitle = postForm['userTitle'] if 'userTitle' in postForm else ""
        userIntro = postForm['userIntro'] if 'userIntro' in postForm else ""
        if userType == "student":
            if not session.query(Student).filter(Student.stuId == userId).all():
                user = Student(stuId=userId, stuPwd=userPwd)
                if userName:
                    user.stuName = userName
                if userGender:
                    user.stuGender = userGender
                if userSchool:
                    user.stuSchool = userSchool
                if userGrade:
                    user.stuGrade = userGrade
                if userLocation:
                    user.stuLocation = userLocation
                if userMail:
                    user.stuMail = userMail
                if userTel:
                    user.userTel = userTel
                user.save()
                return json.dumps({
                    'success': True
                }, ensure_ascii=False)
            else:
                return "UserIdRepeat", 402
        elif userType == "teacher":
            if not session.query(Teacher).filter(Teacher.teaId == userId).all():
                user = Teacher(teaId=userId, teaPwd=userPwd)
                if userName:
                    user.teaName = userName
                if userGender:
                    user.teaGender = userGender
                if userTitle:
                    user.teaTitle = userTitle
                if userSchool:
                    user.teaSchool = userSchool
                if userMail:
                    user.teaMail = userMail
                if userTel:
                    user.teaTel = userTel
                if userIntro:
                    user.teaIntro = userIntro
                user.save()
                return json.dumps({
                    'success': True
                }, ensure_ascii=False)
            else:
                return "UserIdRepeat", 402
        else:
            return "UserTypeError", 403
    else:
        return "RequestError", 404


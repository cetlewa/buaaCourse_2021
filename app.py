import json
from flask import Flask, request
from DataBase.mysql import session
from DataBase.models.User import User
from DataBase.models.Course import Course

# 配置
app = Flask(__name__)
app.config.from_object(__name__)

# WrongPassword 400
# NotRegistered 401
# UserIdRepeat  402
#
# RequestError  404

@app.route('/')
def hello_world():  # put application's code here
    return 'Hello World!'

@app.route('/login', methods=['POST', 'GET'])
def login():
    if request.method == 'POST':
        postForm = json.loads(request.get_data(as_text=True))
        userId = postForm['userId']
        userPwd = postForm['userPwd']
        if session.query(User).filter(User.userId == userId).all():
            ans = session.query(User.userPwd).filter(User.userId == userId).first()
            if ans[0] == userPwd:
                return json.dumps({
                    'success': True
                }, ensure_ascii=False)
            else:
                return "WrongPassword", 400
        else:
            return "NotRegistered", 401
    else:
        return "RequestError", 404

@app.route('/queryAllCourse', methods=['POST', 'GET'])
def queryAllCourse():
    if request.method == 'GET':
        ans = []
        courseList = session.query(Course).all()
        for i in courseList:
            ans.append(
                {
                    'courseId': i.courseId,
                    'courseName': i.courseName,
                    'courseAttribute': i.courseAttribute,
                    'courseLocation': i.courseLocation,
                    'courseTeacher': i.courseTeacher,
                    'courseType': i.courseType,
                    'courseSchool': i.courseSchool,
                    'coursePoint': i.coursePoint,
                    'courseSelected': i.courseSelected,
                    'courseCapacity': i.courseCapacity,
                    'courseIntroduction': i.courseIntroduction
                })
        return json.dumps(ans, ensure_ascii=False)
    else:
        return "RequestError", 404


@app.route('/register', methods=['POST', 'GET'])
def register():
    if request.method == 'POST':
        postForm = json.loads(request.get_data(as_text=True))
        userId = postForm['userId']
        userPwd = postForm['userPwd']
        userName = postForm['userName'] if 'userName' in postForm else ""
        userTel = postForm['userTel'] if 'userTel' in postForm else ""
        userSchool = postForm['userSchool'] if 'userSchool' in postForm else ""
        if not session.query(User).filter(User.userId == userId).all():
            user = User(userId=userId, userPwd=userPwd)
            if userName:
                user.userName = userName
            if userTel:
                user.userTel = userTel
            if userSchool:
                user.userSchool = userSchool
            user.save()
            return json.dumps({
                'success': True
            }, ensure_ascii=False)
        else:
            return "UserIdRepeat", 402
    else:
        return "RequestError", 404


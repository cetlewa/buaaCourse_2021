from DataBase.models.Object import Object
from sqlalchemy import Column, Integer, String, VARCHAR, Float

class Course(Object):
    __tablename__ = "Course"
    courseId = Column(VARCHAR(100), primary_key=True, autoincrement=True)
    courseName = Column(VARCHAR(100), nullable=True)
    courseAttribute = Column(VARCHAR(100), nullable=True)
    courseLocation = Column(VARCHAR(100), nullable=True)
    courseTime = Column(VARCHAR(200), nullable=True)
    courseType = Column(VARCHAR(100), nullable=True)
    courseSchool = Column(VARCHAR(100), nullable=True)
    coursePoint = Column(Float, nullable=True)
    courseCapacity = Column(Integer, nullable=True)
    courseTeacher = Column(VARCHAR(10), nullable=True)
    courseSelected = Column(Integer, nullable=True)
    courseIntroduction = Column(VARCHAR(255), nullable=True)

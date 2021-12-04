from DataBase.models.Object import Object
from sqlalchemy import Column, Integer, String, VARCHAR, Float

class Course(Object):
    __tablename__ = "Course"
    cosId = Column(VARCHAR(100), primary_key=True)
    cosName = Column(VARCHAR(100), nullable=True)
    cosAttribute = Column(VARCHAR(100), nullable=True)
    cosLocation = Column(VARCHAR(100), nullable=True)
    cosTime = Column(VARCHAR(200), nullable=True)
    cosType = Column(VARCHAR(100), nullable=True)
    cosSchool = Column(VARCHAR(100), nullable=True)
    cosPoint = Column(Float, nullable=True)
    cosCapacity = Column(Integer, nullable=True)
    cosTeacher = Column(VARCHAR(10), nullable=True)
    cosSelected = Column(Integer, nullable=True)
    cosIntro = Column(VARCHAR(255), nullable=True)

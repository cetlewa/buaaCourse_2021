from DataBase.models.Object import Object
from sqlalchemy import Column, Integer, String, VARCHAR, Float

class Comment(Object):
    __tablename__ = "Comment"
    comId = Column(Integer, primary_key=True, autoincrement=True)
    comScore = Column(VARCHAR(20))
    comText = Column(VARCHAR(300), nullable=True)

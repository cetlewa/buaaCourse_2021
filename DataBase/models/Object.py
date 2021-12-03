from DataBase.mysql import Base, session

class Object(Base):
    __abstract__ = True

    def save(self):
        # 保存对象
        session.add(self)
        # 提交事务
        session.commit()

    def update(self):
        # 提交事务
        session.commit()

    def delete(self):
        # 删除对象
        session.delete(self)
        # 提交事务
        session.commit()
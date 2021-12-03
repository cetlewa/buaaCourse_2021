from sqlalchemy import create_engine
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import scoped_session, sessionmaker

from DataBase.configs import *

engine = create_engine(SQLALCHEMY_DATABASE_URI, echo=SQLALCHEMY_ECHO)
Session = scoped_session(sessionmaker(bind=engine))
session = Session()
Base = declarative_base()

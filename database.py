from flask_sqlalchemy import SQLAlchemy
from flask import Flask


app = Flask(__name__)
db = SQLAlchemy(app)

class Registrations(db.Model):
    sno = db.Column(db.Integer, primary_key = True)
    username = db.Column(db.String(25), unique = True, nullable = False)
    email = db.Column(db.String(40), nullable = False)
    date = db.Column(db.String(12))

class Posts(db.Model):
    sno = db.Column(db.Integer, primary_key = True)
    username = db.Column(db.String(25), unique = True, nullable = False)
    content = db.Column(db.String(300), nullable = False)
    date = db.Column(db.String(12))

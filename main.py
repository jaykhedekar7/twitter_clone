from flask import Flask, render_template, url_for, request, session, redirect
from flask_sqlalchemy import SQLAlchemy
from sqlalchemy import desc
from werkzeug.security import generate_password_hash, check_password_hash
import json
from datetime import datetime
import random
import os
import math

with open('config.json', 'r') as c:
    params = json.load(c)["params"]

app = Flask(__name__)
app.secret_key = os.urandom(24)
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

SESSION_COOKIE_SECURE=True
SESSION_COOKIE_NAME='mbaforum-website'

if (params["local_server"]):
    app.config['SQLALCHEMY_DATABASE_URI'] = params['local_uri']
else:
    app.config['SQLALCHEMY_DATABASE_URI'] = params['prod_uri']

db = SQLAlchemy(app)

class Registration(db.Model):
    sno = db.Column(db.Integer, primary_key = True)
    username = db.Column(db.String(25), unique = True, nullable = False)
    email = db.Column(db.String(40), nullable = False)
    password = db.Column(db.String(200), nullable = False)
    date = db.Column(db.String(12))


class Posts(db.Model):
    sno = db.Column(db.Integer, primary_key = True)
    username = db.Column(db.String(25), unique = True, nullable = False)
    content = db.Column(db.String(300), nullable = False)
    date = db.Column(db.String(12))


@app.route('/', methods = ['GET', 'POST'])
def home():
    posts = Posts.query.filter_by().order_by(desc(Posts.date))
    if request.method == 'POST':
        username = request.form.get('username')
        content = request.form.get('content')

        entry = Posts(username=username, content=content, date=datetime.now())
        db.session.add(entry)
        db.session.commit()
        return redirect ('/')

    return render_template('index.html', params=params, posts=posts)


@app.route('/registration', methods = ['GET', 'POST'])
def registration():
    if request.method == 'POST':
        username = request.form.get('username')
        email = request.form.get('email')
        password =  generate_password_hash(request.form.get('password'))

        enter = Registration(username=username, email=email, password=password, date=datetime.now())
        db.session.add(enter)
        db.session.commit()
        return redirect ('/registration')

    return render_template('register.html', params=params)


# Probelm with login function. Unable to match form credential with credential in database
@app.route('/login',methods = ['GET', 'POST'])
def login():
    if request.method == 'POST':
        username_form = request.form.get('username')
        password = request.form.get('password')
        pass_db = db.engine.execute("SELECT * FROM registration WHERE password = 'password'")
        user_db = db.engine.execute("SELECT * FROM registration WHERE username = 'username_form'")
        check_pass = check_password_hash(pass_db, password)

        if username_form == user_db & check_pass == True:
            return redirect('/')
        else:
            return redirect('/registration')
    return render_template('login.html', params=params)


if __name__ == '__main__':
    app.run(debug=True)
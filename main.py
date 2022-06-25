from flask import Flask, render_template, request
from flask_sqlalchemy import SQLAlchemy
from database import *

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = "mysql://root:@localhost/grocerystore"
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
db = SQLAlchemy(app)


@app.route("/")
def home():
    return render_template('index.html')


# ===============================================================STORE=================


@app.route("/products", methods=['GET'])
def product():
    data = Products.query.filter_by().all()
    return render_template('product.html', products=data)


@app.route("/products/<int:p_id>", methods=['GET'])
def singleview(p_id):
    vdata = Products.query.filter_by(product_id=p_id).all()
    return render_template('singleView.html', products=vdata)


@app.route("/profile")
def profile():
    return render_template('profile.html')


# ==============================================================customer registration=================

@app.route("/signup", methods=['GET', 'POST'])
def cus_signup():
    if request.method == 'POST':
        f_name = request.form.get('fname')
        l_name = request.form.get('lname')
        email = request.form.get('email')
        mobile = request.form.get('phone')
        address = request.form.get('address')
        pin = request.form.get('zip')
        city = request.form.get('city')
        state = request.form.get('state')
        data = Userregister(first_name=f_name, last_name=l_name, cus_email=email, cus_mobile=mobile, address=address,
                            pincode=pin, city=city, state=state)
        db.session.add(data)
        db.session.commit()
        return 'Hey!' + f_name + ' ' + l_name + '  You have been registerd successfully!!'
    return render_template('cus_register.html')


# =============================================================== Aboutus/ CONTACT US=================
@app.route("/about", methods=['GET', 'POST'])
def about():
    return render_template('about.html')


@app.route("/contact", methods=['GET', 'POST'])
def contact():
    if request.method == 'POST':
        name = request.form.get('cname')
        email = request.form.get('cemail')
        desc = request.form.get('cdesp')
        data = Feedback(feedback_name=name, feedback_email=email, feedback_desp=desc)
        db.session.add(data)
        db.session.commit()
        return 'Feedback sent successfully!!'
    return render_template('contact.html')


# ===========================================================login======

@app.route("/login")
def login():
    return render_template('login.html')


# =========================================payment===============
@app.route("/payment")
def payment():
    return render_template('payment.html')


# ============================================================ ADMIN================================================

@app.route('/admin', methods=['GET', 'POST'])
def adalproduct():
    data = Products.query.filter_by().all()
    fdata = Feedback.query.filter_by().all()
    cdata = Userregister.query.filter_by().all()

    if request.method == 'POST':
        p_name = request.form.get('p_name')
        p_price = request.form.get('p_price')
        p_qty = request.form.get('p_qty')
        cate_id = request.form.get('p_category')
        # p_img = request.form.get('img')
        p_desp = request.form.get('p_desc')
        data = Products(product_name=p_name, product_price=p_price, product_qty=p_qty, category_id=cate_id,
                        product_desp=p_desp)
        db.session.add(data)
        db.session.commit()
        return "Product added Successfully"

    return render_template('admini.html', products=data, feedback=fdata, customer=cdata)


if __name__ == '__main__':
    app.run(debug=True)


from main import db


class Userregister(db.Model):
    cus_id = db.Column(db.Integer, primary_key=True)
    first_name = db.Column(db.String(80), nullable=False)
    last_name = db.Column(db.String(20), nullable=False)
    cus_email = db.Column(db.String(12), nullable=False)
    cus_mobile = db.Column(db.Integer, nullable=False)
    address = db.Column(db.String(12), nullable=True)
    pincode = db.Column(db.Integer, nullable=True)
    city = db.Column(db.String(12), nullable=True)
    state = db.Column(db.String(12), nullable=True)
    # cus_img = db.Column(db.String(12), nullable=True)


class Products(db.Model):
    product_id = db.Column(db.Integer, primary_key=True)
    product_name = db.Column(db.String(50), nullable=False)
    product_price = db.Column(db.Integer, nullable=False)
    product_qty = db.Column(db.Integer, nullable=False)
    category_id = db.Column(db.Integer, nullable=False)
    # product_img = db.Column(db.LargeBinary, nullable = False)
    product_desp = db.Column(db.String(500), nullable=True)


class Feedback(db.Model):
    feedback_id = db.Column(db.Integer, primary_key=True)
    feedback_name = db.Column(db.String(30), nullable=False)
    feedback_email = db.Column(db.String(30), nullable=False)
    feedback_desp = db.Column(db.String(30), nullable=False)
    cus_id = db.Column(db.Integer, nullable=False)


















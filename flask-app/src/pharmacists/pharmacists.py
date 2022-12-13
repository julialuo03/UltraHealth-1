from flask import Blueprint, request, jsonify, make_response, current_app
import json
from src import db


pharmacists = Blueprint('pharmacists', __name__)

# Add the Start Time, End Time and Still Taking values to prescription
@pharmacists.route('/update_prescription', methods = ['POST'])
def update_prescription():
    current_app.logger.info(request.form)
    cursor = db.get_db().cursor()
    StartDate = request.form['StartDate']
    EndDate = request.form['EndDate']
    RxNumber = request.form['RxNumber']
    StillTaking = request.form['StillTaking']
    query = f'UPDATE Prescription SET StartDate = \"{StartDate}\", EndDate = \"{EndDate}\", StillTaking = \"{StillTaking}\" where RxNumber = {RxNumber}'
    current_app.logger.info(query)
    cursor.execute(query)
    db.get_db().commit()
    return 'Success!'

# Add a new order
@pharmacists.route('/fill_order', methods = ['POST'])
def fill_order():
    current_app.logger.info(request.form)
    cursor = db.get_db().cursor()
    RxNumber = request.form['RxNumber']
    Total = request.form['Total']
    OrderDate = request.form['OrderDate']
    PatientID = request.form['PatientID']
    query = f'INSERT INTO Orders(RxNumber, Total, OrderDate, Patient_ID) VALUES (\"{RxNumber}\", \"{Total}\", \"{OrderDate}\", \"{PatientID}\")'
    cursor.execute(query)
    db.get_db().commit()
    return 'Success!'

# Get all orders
@pharmacists.route('/orders', methods=['GET'])
def get_orders():
    cursor = db.get_db().cursor()
    cursor.execute('SELECT * FROM Orders order by Order_ID desc')
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

# Get all prescriptions
@pharmacists.route('/prescriptions', methods=['GET'])
def get_prescriptions():
    cursor = db.get_db().cursor()
    cursor.execute(f'select * from Prescription')
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response
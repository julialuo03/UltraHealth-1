from flask import Blueprint, request, jsonify, make_response, current_app
import json
from src import db


doctors = Blueprint('doctors', __name__)

# Get all patients
@doctors.route('/patients/<var>', methods=['GET'])
def get_patients(var):
    cursor = db.get_db().cursor()
    cursor.execute(f'select * from Patient where PrimaryDoctor = {var}')
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

# Add a new patient in the dataset
@doctors.route('/new_patient/<doc_id>', methods = ['POST'])
def add_patient(doc_id):
    current_app.logger.info(request.form)
    cursor = db.get_db().cursor()
    name = request.form['name']
    dob = request.form['dob']
    address = request.form['address']
    city = request.form['city']
    state = request.form['state']
    zip = request.form['zip']
    email = request.form['email']
    phone = request.form['phone']
    query = f'INSERT INTO Patient(Name, DOB, Address, City, State, ZipCode, Email, PhoneNumber, PrimaryDoctor) VALUES (\"{name}\", \"{dob}\", \"{address}\", \"{city}\", \"{state}\", \"{zip}\", \"{email}\", \"{phone}\", {doc_id})'
    cursor.execute(query)
    db.get_db().commit()
    return 'Success!'

# Get the doctors name for the dropdown menu
@doctors.route('get_doc_info', methods = ['GET'])
def get_doc_info():
    current_app.logger.info(request.form)
    cursor = db.get_db().cursor()
    cursor.execute('select Doctor_ID as value, Name as label from Doctor')
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response


# Add a new prescription in the dataset
@doctors.route('/new_prescription', methods = ['POST'])
def add_prescription():
    current_app.logger.info(request.form)
    cursor = db.get_db().cursor()
    Patient_ID = request.form['Patient_ID']
    NDC_Code = request.form['NDC_Code']
    RefillNumber = request.form['RefillNumber']
    query = f'INSERT INTO Prescription(Patient_ID, NDC_Code, RefillNumber) VALUES (\"{Patient_ID}\", \"{NDC_Code}\", \"{RefillNumber}\")'
    cursor.execute(query)
    db.get_db().commit()
    return 'Success!'
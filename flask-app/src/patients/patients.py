from flask import Blueprint, request, jsonify, make_response, current_app
import json
from src import db

patients = Blueprint('patients', __name__)

# Get all doctors
@patients.route('/doctors', methods=['GET'])
def get_doctors():
    cursor = db.get_db().cursor()
    cursor.execute('select * from Doctor')
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

# Get patients info for dropdown
@patients.route('/pat_info', methods = ['GET'])
def get_pat_info():
    cursor = db.get_db().cursor()
    cursor.execute('select Name as label, Patient_ID as value from Patient')
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

# Get all pharmacies
@patients.route('/pharmacies', methods=['GET'])
def get_pharmacies():
    cursor = db.get_db().cursor()
    cursor.execute('select * from Pharmacy')
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

# Get the prescriptions for a specific patient
@patients.route('/prescriptions/<pat_id>', methods=['GET'])
def get_prescriptions(pat_id):
    cursor = db.get_db().cursor()
    cursor.execute(f'select * from Prescription where Patient_ID = {pat_id}')
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response
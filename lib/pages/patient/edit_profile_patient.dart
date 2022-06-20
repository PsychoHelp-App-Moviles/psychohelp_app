import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:psychohelp_app/models/patient.dart';
import 'package:psychohelp_app/utils/http_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class EditPatientProfile extends StatefulWidget {
  const EditPatientProfile(this.patient);
  final Patient patient;

  @override
  State<EditPatientProfile> createState() => _EditPatientProfileState();
}

class _EditPatientProfileState extends State<EditPatientProfile> {
  HttpHelper httpHelper = HttpHelper();
  Patient? patient;

  DateTime selectedDate = DateTime.now();

  final TextEditingController controllerFirtsName = TextEditingController();
  final TextEditingController controllerLastName = TextEditingController();
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerPhone = TextEditingController();
  var controllerBirthday = TextEditingController();
  final TextEditingController controllerImg = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
      ),
      body: getBody(),
    );
  }

  @override
  void initState() {
    httpHelper = HttpHelper();
    controllerFirtsName.text = widget.patient.firstName;
    controllerLastName.text = widget.patient.lastName;
    controllerEmail.text = widget.patient.email;
    controllerPhone.text = widget.patient.phone;
    controllerBirthday.text = widget.patient.date;
    controllerImg.text = widget.patient.img;
    super.initState();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1920, 1),
        lastDate: DateTime.now());
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        controllerBirthday.text = selectedDate.toString().substring(0, 10);
      });
    }
  }

  Future<void> updatePatientData(Patient patient) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String user = jsonEncode(patient);
    prefs.setString('patient', user);
  }

  Widget getBody() {
    return new ListView(
      controller: ScrollController(),
      padding: const EdgeInsets.all(16.0),
      children: <Widget>[
        SizedBox(height: 16),
        TextField(
          controller: controllerFirtsName,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 13, vertical: 10),
            border: OutlineInputBorder(),
            labelText: 'Firstname',
          ),
        ),
        SizedBox(height: 16),
        TextField(
          controller: controllerLastName,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 13, vertical: 10),
            border: OutlineInputBorder(),
            labelText: 'Lastname',
          ),
        ),
        SizedBox(height: 16),
        TextField(
          controller: controllerEmail,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 13, vertical: 10),
            border: OutlineInputBorder(),
            labelText: 'Email',
          ),
        ),
        SizedBox(height: 16),
        TextField(
          controller: controllerPhone,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 13, vertical: 10),
            border: OutlineInputBorder(),
            labelText: 'Phone',
          ),
        ),
        SizedBox(height: 16),
        TextField(
          controller: controllerBirthday,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 13, vertical: 10),
            border: OutlineInputBorder(),
            labelText: 'Birthday',
            hintText: 'Enter your birthday',
            suffixIcon: IconButton(
                splashRadius: 20,
                icon: Icon(
                  Icons.date_range,
                  color: Colors.black,
                ),
                onPressed: () {
                  _selectDate(context);
                }),
          ),
        ),
        SizedBox(height: 16),
        TextField(
          controller: controllerImg,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 13, vertical: 10),
            border: OutlineInputBorder(),
            labelText: 'ImageURL',
          ),
        ),
        SizedBox(height: 16),
        ElevatedButton(
          child: Text('Save'),
          onPressed: () async {
            String firstName = controllerFirtsName.text;
            String lastName = controllerLastName.text;
            String email = controllerEmail.text;
            String phone = controllerPhone.text;
            String birthday = controllerBirthday.text;
            String img = controllerImg.text;

            Patient patientInfo = Patient(
                id: widget.patient.id,
                firstName: firstName,
                lastName: lastName,
                email: email,
                phone: phone,
                password: widget.patient.password,
                date: birthday,
                gender: widget.patient.gender,
                img: img);
            await httpHelper.updatePatient(widget.patient.id, patientInfo);
            updatePatientData(patientInfo);
            Navigator.pop(context, patientInfo);
          },
        ),
      ],
    );
  }
}

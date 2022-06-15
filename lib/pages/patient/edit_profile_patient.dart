import 'package:flutter/material.dart';
import 'package:psychohelp_app/models/patient.dart';
import 'package:psychohelp_app/utils/http_helper.dart';

class EditPatientProfile extends StatefulWidget {
  const EditPatientProfile(this.patient);
  final Patient patient;

  @override
  State<EditPatientProfile> createState() => _EditPatientProfileState();
}

class _EditPatientProfileState extends State<EditPatientProfile> {
  HttpHelper httpHelper = HttpHelper();
  Patient? patient;

  final TextEditingController controllerFirtsName = TextEditingController();
  final TextEditingController controllerLastName = TextEditingController();
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerPhone = TextEditingController();
  final TextEditingController controllerBirthday = TextEditingController();
  final TextEditingController controllerGender = TextEditingController();
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
    controllerGender.text = widget.patient.gender;
    controllerImg.text = widget.patient.img;
    super.initState();
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
            border: OutlineInputBorder(),
            labelText: 'Firstname',
          ),
        ),
        SizedBox(height: 16),
        TextField(
          controller: controllerLastName,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Lastname',
          ),
        ),
        SizedBox(height: 16),
        TextField(
          controller: controllerEmail,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Email',
          ),
        ),
        SizedBox(height: 16),
        TextField(
          controller: controllerPhone,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Phone',
          ),
        ),
        SizedBox(height: 16),
        TextField(
          controller: controllerBirthday,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Birthday',
          ),
        ),
        SizedBox(height: 16),
        TextField(
          controller: controllerGender,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Gender',
          ),
        ),
        SizedBox(height: 16),
        TextField(
          controller: controllerImg,
          decoration: InputDecoration(
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
            String gender = controllerGender.text;
            String img = controllerImg.text;

            Patient patientInfo = Patient(
                id: widget.patient.id,
                firstName: firstName,
                lastName: lastName,
                email: email,
                phone: phone,
                password: widget.patient.password,
                date: birthday,
                gender: gender,
                img: img);
            await httpHelper.updatePatient(widget.patient.id, patientInfo);
            Navigator.pop(context, patientInfo);
          },
        ),
      ],
    );
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:psychohelp_app/models/psychologist.dart';
import 'package:psychohelp_app/utils/http_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditedPsychoProfile extends StatefulWidget {
  const EditedPsychoProfile(this.pyschologist);
  final Psychologist pyschologist;

  @override
  State<EditedPsychoProfile> createState() => _EditedPsychoProfileState();
}

class _EditedPsychoProfileState extends State<EditedPsychoProfile> {
  HttpHelper httpHelper = HttpHelper();
  Psychologist? psychologist;

  final TextEditingController controllerName = TextEditingController();
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerPhone = TextEditingController();
  final TextEditingController controllerBirthday = TextEditingController();
  final TextEditingController controllerGender = TextEditingController();
  final TextEditingController controllerSpecialization =
      TextEditingController();
  final TextEditingController controllerFormation = TextEditingController();
  final TextEditingController controllerCMP = TextEditingController();
  final TextEditingController controllerSessionType = TextEditingController();
  final TextEditingController controllerAbout = TextEditingController();
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
    controllerName.text = widget.pyschologist.name;
    controllerEmail.text = widget.pyschologist.email;
    controllerPhone.text = widget.pyschologist.phone;
    controllerBirthday.text = widget.pyschologist.birthday;
    controllerGender.text = widget.pyschologist.gender;
    controllerSpecialization.text = widget.pyschologist.specialization;
    controllerFormation.text = widget.pyschologist.formation;
    controllerCMP.text = widget.pyschologist.cmp;
    controllerSessionType.text = widget.pyschologist.sessionType;
    controllerAbout.text = widget.pyschologist.about;
    controllerImg.text = widget.pyschologist.img;
    super.initState();
  }

  Future<void> updatePsychologistData(Psychologist psychologist) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String user = jsonEncode(psychologist);
    prefs.setString('psychologist', user);
  }

  Widget getBody() {
    return new ListView(
      controller: ScrollController(),
      padding: const EdgeInsets.all(16.0),
      children: <Widget>[
        SizedBox(height: 16),
        TextField(
          controller: controllerName,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Name',
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
          controller: controllerSpecialization,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Specialization',
          ),
        ),
        SizedBox(height: 16),
        TextField(
          controller: controllerFormation,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Formation',
          ),
        ),
        SizedBox(height: 16),
        TextField(
          controller: controllerCMP,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'CMP',
          ),
        ),
        SizedBox(height: 16),
        TextField(
          controller: controllerSessionType,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Session type',
          ),
        ),
        SizedBox(height: 16),
        TextField(
          controller: controllerAbout,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'About',
          ),
        ),
        SizedBox(height: 16),
        TextField(
          controller: controllerImg,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Photo URl',
          ),
        ),
        SizedBox(height: 16),
        ElevatedButton(
          child: Text('Save'),
          onPressed: () async {
            String name = controllerName.text;
            String email = controllerEmail.text;
            String phone = controllerPhone.text;
            String birthday = controllerBirthday.text;
            String gender = controllerGender.text;
            String specialization = controllerSpecialization.text;
            String formation = controllerFormation.text;
            String cmp = controllerCMP.text;
            String sessionType = controllerSessionType.text;
            String about = controllerAbout.text;
            String img = controllerImg.text;

            Psychologist psychologistInfo = Psychologist(
                id: widget.pyschologist.id,
                name: name,
                dni: widget.pyschologist.dni,
                birthday: birthday,
                email: email,
                password: widget.pyschologist.password,
                phone: phone,
                specialization: specialization,
                formation: formation,
                about: about,
                gender: gender,
                sessionType: sessionType,
                img: img,
                cmp: cmp,
                active: widget.pyschologist.active,
                fresh: widget.pyschologist.fresh);
            await httpHelper.updatePsychologist(
                widget.pyschologist.id, psychologistInfo);
            updatePsychologistData(psychologistInfo);
            Navigator.pop(context, psychologistInfo);
          },
        ),
      ],
    );
  }
}

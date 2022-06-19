import 'package:flutter/material.dart';
import 'package:psychohelp_app/pages/authentication/login.dart';
import 'package:psychohelp_app/utils/http_helper.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class RegisterPatient extends StatefulWidget {
  static const String routeName = "/patientRegister";

  @override
  State<RegisterPatient> createState() => _RegisterPatientState();
}

class _RegisterPatientState extends State<RegisterPatient> {
  HttpHelper httpHelper = HttpHelper();
  DateTime selectedDate = DateTime.now();

  final List<String> genderItems = [
    'Male',
    'Female',
    'Other',
  ];

  String selectedValue = "TestString";

  final TextEditingController controllerFirtsName = TextEditingController();
  final TextEditingController controllerLastName = TextEditingController();
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerPhone = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();
  var controllerBirthday = TextEditingController();
  final TextEditingController controllerImg = TextEditingController();

  late bool _passwordVisible;

  @override
  void initState() {
    httpHelper = HttpHelper();
    _passwordVisible = false;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            margin: const EdgeInsets.symmetric(horizontal: 40.0),
            width: MediaQuery.of(context).size.width,
            child: Align(
                alignment: Alignment.center,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 30),
                      Padding(
                        padding: EdgeInsets.only(bottom: 10.0),
                        child: Text('Registro paciente',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            )),
                      ),
                      SizedBox(height: 16),
                      TextField(
                        controller: controllerFirtsName,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 13, vertical: 10),
                          border: OutlineInputBorder(),
                          labelText: 'First name',
                        ),
                      ),
                      SizedBox(height: 16),
                      TextField(
                        controller: controllerLastName,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 13, vertical: 10),
                          border: OutlineInputBorder(),
                          labelText: 'Last name',
                        ),
                      ),
                      SizedBox(height: 16),
                      TextField(
                        controller: controllerEmail,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 13, vertical: 10),
                          border: OutlineInputBorder(),
                          labelText: 'Email',
                        ),
                      ),
                      SizedBox(height: 16),
                      TextField(
                        controller: controllerPassword,
                        obscureText: !_passwordVisible,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 13, vertical: 10),
                          isDense: true,
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                          hintText: 'Enter your password',
                          suffixIcon: IconButton(
                              padding: EdgeInsets.zero,
                              splashRadius: 20,
                              icon: Icon(
                                _passwordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.black,
                              ),
                              onPressed: () {
                                setState(() {
                                  _passwordVisible = !_passwordVisible;
                                });
                              }),
                        ),
                      ),
                      SizedBox(height: 16),
                      TextField(
                        controller: controllerBirthday,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 13, vertical: 10),
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
                        controller: controllerPhone,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 13, vertical: 10),
                          border: OutlineInputBorder(),
                          labelText: 'Phone',
                        ),
                      ),
                      SizedBox(height: 16),
                      DropdownButtonFormField2(
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.zero,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        isExpanded: true,
                        hint: const Text(
                          'Gender',
                        ),
                        icon: const Icon(
                          Icons.arrow_drop_down,
                          color: Colors.black45,
                        ),
                        iconSize: 30,
                        buttonHeight: 48,
                        buttonPadding:
                            const EdgeInsets.only(left: 14, right: 10),
                        dropdownDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        items: genderItems
                            .map((item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(
                                    item,
                                    style: const TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ))
                            .toList(),
                        onChanged: (value) {
                          //Do something when changing the item if you want.
                          setState(() {
                            selectedValue = value.toString();
                          });
                        },
                        onSaved: (value) {},
                      ),
                      SizedBox(height: 16),
                      TextField(
                        controller: controllerImg,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 13, vertical: 10),
                          border: OutlineInputBorder(),
                          hintText: 'Enter your Photo URL',
                          labelText: 'Photo URL',
                        ),
                      ),
                      SizedBox(height: 16),
                      ElevatedButton(
                        child: Text('Registrarme',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            )),
                        onPressed: () async {
                          String firstName = controllerFirtsName.text;
                          String lastName = controllerLastName.text;
                          String email = controllerEmail.text;
                          String password = controllerPassword.text;
                          String date = controllerBirthday.text;
                          String phone = controllerPhone.text;
                          String gender = selectedValue;
                          String img =
                              "https://img2.freepng.es/20180714/ro/kisspng-computer-icons-user-membership-vector-5b498fc76f2a07.4607730515315475914553.jpg";
                          await httpHelper.createPatient(
                            1,
                            firstName,
                            lastName,
                            email,
                            password,
                            date,
                            phone,
                            gender,
                            img,
                          );
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Login()));
                        },
                      ),
                    ],
                  ),
                ))));
  }
}

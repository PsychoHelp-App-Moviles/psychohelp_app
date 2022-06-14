import 'package:flutter/material.dart';
import 'package:psychohelp_app/models/patient.dart';

class Profile_patient extends StatefulWidget {
  static const String routeName = "/profile_patient";
  @override
  State<Profile_patient> createState() => _Profile_patientState();
}

class _Profile_patientState extends State<Profile_patient> {
  late Patient patient;

  @override
  void initState() {
    patient = new Patient(
        id: 1,
        firstName: "Santiago",
        lastName: "Cuentas",
        email: "email",
        phone: "phone",
        password: "password",
        date: "date",
        gender: "gender",
        img:
            "https://cdns-images.dzcdn.net/images/artist/8fd2490e2612a5ca852d3026b58465fa/500x500.jpg");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(patient.img),
              radius: 75.0,
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  patient.firstName + " " + patient.lastName,
                  style: TextStyle(fontSize: 30.0),
                ),
              ],
            ),
            SizedBox(height: 10),
            Column(
              children: [
                Card(
                  child: Container(
                    padding: EdgeInsets.all(20.0),
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Column(
                      children: [
                        Text("Email: " + patient.email,
                            style: TextStyle(fontSize: 20.0)),
                        SizedBox(height: 10),
                        Text("Phone: " + patient.phone,
                            style: TextStyle(fontSize: 20.0)),
                        SizedBox(height: 10),
                        Text("Birthday: " + patient.date,
                            style: TextStyle(fontSize: 20.0)),
                        SizedBox(height: 10),
                        Text("Gender: " + patient.gender,
                            style: TextStyle(fontSize: 20.0)),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton.icon(
                    onPressed: () {
                      setState(() => {});
                    },
                    icon: Icon(
                      Icons.edit_outlined,
                      size: 25,
                    ),
                    label:
                        Text("Edit profile", style: TextStyle(fontSize: 20.0)))
              ],
            )
          ],
        ),
      ),
    );
  }
}

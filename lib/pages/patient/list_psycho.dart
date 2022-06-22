// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:psychohelp_app/utils/http_helper.dart';

class List_psycho extends StatefulWidget {
  static const String routeName = "/list_psycho";
  @override
  State<List_psycho> createState() => _List_psychoState();
}

class _List_psychoState extends State<List_psycho> {
  List psychologists = [];
  HttpHelper httpHelper = HttpHelper();

  @override
  void initState() {
    psychologists = [];
    httpHelper = HttpHelper();
    fetchPsychologists();
    super.initState();
  }

  void fetchPsychologists() {
    httpHelper.fetchPsychologist().then((value) {
      setState(() {
        this.psychologists = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text("Psychologists list"),
        ),
        body: ListView.builder(
            padding: EdgeInsets.all(30.0),
            itemCount: psychologists.length,
            itemBuilder: (context, index) {
              return Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 10.0),
                    child: CircleAvatar(
                        radius: 50,
                        backgroundImage:
                            NetworkImage(psychologists[index].img)),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(psychologists[index].name),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(psychologists[index].cmp),
                  ButtonBar(
                    alignment: MainAxisAlignment.center,
                    children: <Widget>[
                      FlatButton(
                        child: Text("See more"),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) => SimpleDialog(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                        Radius.circular(10.0),
                                      )),
                                      title: Text(
                                        "Detalles del psicólogo",
                                        textAlign: TextAlign.center,
                                      ),
                                      contentPadding: EdgeInsets.all(16.0),
                                      children: <Widget>[
                                        CircleAvatar(
                                            radius: 75,
                                            backgroundImage: NetworkImage(
                                                psychologists[index].img)),
                                        Text("Nombre: ",
                                            style: TextStyle(
                                                fontSize: 20.0,
                                                fontFamily: "Roboto",
                                                color: Colors.blue[900]),
                                            textAlign: TextAlign.start),
                                        Text(psychologists[index].name),
                                        SizedBox(height: 5.0),
                                        Text("CMP",
                                            style: TextStyle(
                                                fontSize: 20.0,
                                                fontFamily: "Roboto",
                                                color: Colors.blue[900])),
                                        Text(psychologists[index].cmp),
                                        SizedBox(height: 5.0),
                                        Text(
                                          "DNI",
                                          style: TextStyle(
                                              fontSize: 20.0,
                                              fontFamily: "Roboto",
                                              color: Colors.blue[900]),
                                        ),
                                        Text(psychologists[index].dni),
                                        SizedBox(height: 5.0),
                                        Text(
                                          "Teléfono",
                                          style: TextStyle(
                                              fontSize: 20.0,
                                              fontFamily: "Roboto",
                                              color: Colors.blue[900]),
                                        ),
                                        Text(psychologists[index].phone),
                                        SizedBox(height: 5.0),
                                        Text(
                                          "Especialidad",
                                          style: TextStyle(
                                              fontSize: 20.0,
                                              fontFamily: "Roboto",
                                              color: Colors.blue[900]),
                                        ),
                                        Text(psychologists[index]
                                            .specialization),
                                        SizedBox(height: 5.0),
                                        Text(
                                          "Formación",
                                          style: TextStyle(
                                              fontSize: 20.0,
                                              fontFamily: "Roboto",
                                              color: Colors.blue[900]),
                                        ),
                                        Text(psychologists[index].formation),
                                        SizedBox(height: 5.0),
                                        Text(
                                          "Acerca de mí",
                                          style: TextStyle(
                                              fontSize: 20.0,
                                              fontFamily: "Roboto",
                                              color: Colors.blue[900]),
                                        ),
                                        Text(psychologists[index].about),
                                        SizedBox(height: 5.0),
                                        Text(
                                          "Tipo de Sesión",
                                          style: TextStyle(
                                              fontSize: 20.0,
                                              fontFamily: "Roboto",
                                              color: Colors.blue[900]),
                                        ),
                                        Text(psychologists[index].sessionType)
                                      ]));
                        },
                      ),
                      FlatButton(
                        child: Text("Agendar cita"),
                        onPressed: () {
                          Navigator.pushNamed(context, "/chat",
                              arguments: psychologists[index]);
                        },
                      ),
                    ],
                  )
                ]),
              );
            }));
  }
}

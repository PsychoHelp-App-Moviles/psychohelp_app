// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:psychohelp_app/models/publication.dart';
import 'package:psychohelp_app/pages/psychologist/create_publication.dart';
import 'package:psychohelp_app/pages/psychologist/edit_publication.dart';
import 'package:psychohelp_app/utils/http_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class My_publications extends StatefulWidget {
  static const String routeName = "/my_publications";
  @override
  State<My_publications> createState() => _My_publicationsState();
}

class _My_publicationsState extends State<My_publications> {
  List publications = [];
  HttpHelper httpHelper = HttpHelper();
  Publication publicationInfo = Publication(
    id: 1,
    title: "",
    description: "",
    tags: "",
    content: "",
    photoUrl: "",
  );

  @override
  void initState() {
    publications = [];
    httpHelper = HttpHelper();
    fetchPublications();
    super.initState();
  }

  Future<void> _navigateAndDisplaySelection(BuildContext context) async {
    final result = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => EditedPublication(publicationInfo),
        ));
    setState(() {
      fetchPublications();
    });
  }

  void deletePublicationById(int id) {
    httpHelper.deletePublication(id).then((value) {
      setState(() {
        fetchPublications();
      });
    });
  }

  void fetchPublicationById(int id) {
    httpHelper.fetchPublicationById(id).then((value) {
      setState(() {
        this.publicationInfo = value;
      });
    });
  }

  Future fetchPublications() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final id = prefs.getInt('id');
    httpHelper.fetchPublicationByPsychoId(id!).then((value) {
      setState(() {
        this.publications = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (publications.length == 0) {
      return Scaffold(
        appBar: new AppBar(
          title: new Text("My Publications"),
        ),
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else {
      return new Scaffold(
        appBar: new AppBar(
          title: new Text("My Publications"),
          actions: <Widget>[
            FlatButton(
              child: Icon(Icons.add, color: Colors.white),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CreatePublication()));
              },
            )
          ],
        ),
        body: ListView.builder(
          padding: EdgeInsets.only(top: 15.0, left: 15.0, right: 15.0),
          itemCount: publications.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Container(
                child: Column(children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20)),
                    child: Image.network(
                      publications[index].photoUrl,
                      fit: BoxFit.cover,
                      height: 200,
                      width: double.infinity,
                    ),
                  ),
                  SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 10.0, left: 20.0, right: 20.0),
                    child: Text(publications[index].title,
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0, right: 20.0, top: 10.0),
                    child: Text(publications[index].description,
                        textAlign: TextAlign.justify),
                  ),
                  ButtonBar(
                    alignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      new FlatButton(
                          child: Text('Edit'),
                          onPressed: () {
                            publicationInfo = publications[index];
                            _navigateAndDisplaySelection(context);
                          }),
                      FlatButton(
                          child: Text(
                            'Delete',
                            style: TextStyle(color: Colors.red),
                          ),
                          onPressed: () {
                            deletePublicationById(publications[index].id);
                          }),
                    ],
                  )
                ]),
              ),
            );
          },
        ),
      );
    }
  }
}

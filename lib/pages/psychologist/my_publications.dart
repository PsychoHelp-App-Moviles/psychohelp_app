// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:psychohelp_app/models/publication.dart';
import 'package:psychohelp_app/pages/psychologist/create_publication.dart';
import 'package:psychohelp_app/pages/psychologist/edit_publication.dart';
import 'package:psychohelp_app/utils/http_helper.dart';

class My_publications extends StatefulWidget {
  static const String routeName = "/my_publications";
  @override
  State<My_publications> createState() => _My_publicationsState();
}

class _My_publicationsState extends State<My_publications> {
  List publications = [];
  Publication publicationInfo = Publication(
    id: 1,
    title: "",
    description: "",
    tags: "",
    content: "",
    photoUrl: "",
  );
  HttpHelper httpHelper = HttpHelper();

  @override
  void initState() {
    publications = [];
    httpHelper = HttpHelper();
    fetchPublications();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("My Publications"),
        actions: <Widget>[
          FlatButton(
            child: Icon(Icons.add, color: Colors.white),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CreatePublication()));
            },
          )
        ],
      ),
      body: ListView.builder(
        itemCount: publications.length,
        itemBuilder: (context, index) {
          return PublicationRow(publication: publications[index]);
        },
      ),
    );
  }

  void fetchPublications() {
    httpHelper.fetchPublicationByPsychoId(1).then((value) {
      setState(() {
        this.publications = value;
      });
    });
  }
}

class PublicationRow extends StatefulWidget {
  final Publication publication;
  const PublicationRow({Key? key, required this.publication}) : super(key: key);

  @override
  State<PublicationRow> createState() => _PublicationRowState();
}

class _PublicationRowState extends State<PublicationRow> {
  Publication publicationInfo = Publication(
    id: 1,
    title: "",
    description: "",
    tags: "",
    content: "",
    photoUrl: "",
  );
  HttpHelper httpHelper = HttpHelper();

  @override
  void initState() {
    httpHelper = HttpHelper();
    super.initState();
  }

  Future<void> _navigateAndDisplaySelection(BuildContext context) async {
    final result = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => EditedPublication(publicationInfo),
        ));
    setState(() {
      publicationInfo = result as Publication;
    });
  }

  void fetchPublicationById(int id) {
    httpHelper.fetchPublicationById(id).then((value) {
      setState(() {
        this.publicationInfo = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        child: Column(children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20), topLeft: Radius.circular(20)),
            child: Image.network(
              widget.publication.photoUrl,
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),
          ),
          SizedBox(height: 5),
          Text(widget.publication.title,
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
          // Padding(
          //     padding: const EdgeInsets.all(8.8),
          //     child: Text(publication.title)),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(widget.publication.description,
                textAlign: TextAlign.justify),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              new FlatButton(
                  child: Text('Edit'),
                  onPressed: () {
                    _navigateAndDisplaySelection(context);
                  }),
              FlatButton(
                  child: Text(
                    'Delete',
                    style: TextStyle(color: Colors.red),
                  ),
                  onPressed: () {}),
            ],
          )
        ]),
      ),
    );
  }
}

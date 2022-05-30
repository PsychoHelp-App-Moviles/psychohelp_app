import 'package:flutter/material.dart';
import 'package:psychohelp_app/models/publication.dart';
import 'package:psychohelp_app/utils/http_helper.dart';

class PublicationList extends StatefulWidget {
  @override
  State<PublicationList> createState() => _PublicationListState();
}

class _PublicationListState extends State<PublicationList> {
  List publications = [];
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
    return ListView.builder(
      itemCount: publications.length,
      itemBuilder: (context, index) {
        return PublicationRow(publication: publications[index]);
      },
    );
  }

  void fetchPublications() {
    httpHelper.fetchPublications().then((value) {
      setState(() {
        this.publications = value;
      });
    });
  }
}

class PublicationRow extends StatelessWidget {
  final Publication publication;
  const PublicationRow({Key? key, required this.publication}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(children: <Widget>[
        Image.network(publication.photoUrl),
        Text(publication.title),
        Text(publication.description),
      ]),
    );
  }
}

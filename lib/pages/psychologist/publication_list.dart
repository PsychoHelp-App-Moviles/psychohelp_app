import 'package:cached_network_image/cached_network_image.dart';
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
    if (publications.length == 0) {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else {
      return ListView.builder(
        itemCount: publications.length,
        itemBuilder: (context, index) {
          return Container(
              padding: EdgeInsets.only(top: 15.0, left: 15.0, right: 15.0),
              child: Center(
                  child: Column(
                children: [
                  //PublicationCard(publication: publications[index]),
                  PublicationCard(publication: publications[index]),
                ],
              )));
        },
      );
    }
  }

  void fetchPublications() {
    httpHelper.fetchPublications().then((value) {
      setState(() {
        this.publications = value;
      });
    });
  }
}

class PublicationCard extends StatefulWidget {
  final Publication publication;
  const PublicationCard({Key? key, required this.publication})
      : super(key: key);

  @override
  _PublicationCardState createState() => _PublicationCardState();
}

class _PublicationCardState extends State<PublicationCard> {
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
            child: CachedNetworkImage(
              imageUrl: widget.publication.photoUrl,
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),
          ),
          SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
            child: Text(widget.publication.title,
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
          ),
          // Padding(
          //     padding: const EdgeInsets.all(8.8),
          //     child: Text(publication.title)),
          Padding(
            padding: const EdgeInsets.only(
                left: 20.0, right: 20.0, bottom: 15.0, top: 10.0),
            child: Text(widget.publication.description,
                textAlign: TextAlign.justify),
          ),
        ]),
      ),
    );
  }
}

class PublicationRow extends StatelessWidget {
  final Publication publication;
  const PublicationRow({Key? key, required this.publication}) : super(key: key);

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
            child: CachedNetworkImage(
              imageUrl: publication.photoUrl,
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),
          ),
          SizedBox(height: 5),
          Text(publication.title,
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
          // Padding(
          //     padding: const EdgeInsets.all(8.8),
          //     child: Text(publication.title)),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(publication.description, textAlign: TextAlign.justify),
          ),
        ]),
      ),
    );
  }
}

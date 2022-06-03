// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:psychohelp_app/models/publication.dart';
import 'package:psychohelp_app/utils/http_helper.dart';

class CreatePublication extends StatefulWidget {
  @override
  State<CreatePublication> createState() => _CreatePublicationState();
}

class _CreatePublicationState extends State<CreatePublication> {
  HttpHelper httpHelper = HttpHelper();

  final TextEditingController controllerTitle = TextEditingController();
  final TextEditingController controllerDescription = TextEditingController();
  final TextEditingController controllerTag = TextEditingController();
  final TextEditingController controllerContent = TextEditingController();
  final TextEditingController controllerPhotoUrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Create Publication'),
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    return new ListView(
      padding: const EdgeInsets.all(16.0),
      children: <Widget>[
        SizedBox(height: 16),
        TextField(
          controller: controllerTitle,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Title',
          ),
        ),
        SizedBox(height: 16),
        TextField(
          controller: controllerDescription,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Description',
          ),
        ),
        SizedBox(height: 16),
        TextField(
          controller: controllerTag,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Tag',
          ),
        ),
        SizedBox(height: 16),
        TextField(
          controller: controllerContent,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Content',
          ),
        ),
        SizedBox(height: 16),
        TextField(
          controller: controllerPhotoUrl,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Photo Url',
          ),
        ),
        SizedBox(height: 16),
        RaisedButton(
          child: Text('Create'),
          onPressed: () {},
        ),
        FlatButton(
          child: Text('Cancel'),
          onPressed: () async {
            final String title = controllerTitle.text;
            final String description = controllerDescription.text;
            final String tag = controllerTag.text;
            final String content = controllerContent.text;
            final String photoUrl = controllerPhotoUrl.text;

            final CreatePublication publication = await CreatePublication();
          },
        ),
      ],
    );
  }
}

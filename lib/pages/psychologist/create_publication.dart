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
      controller: ScrollController(),
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
        FlatButton(
          child: Text('Create'),
          onPressed: () async {
            String title = controllerTitle.text;
            String description = controllerDescription.text;
            String tags = controllerTag.text;
            String content = controllerContent.text;
            String photoUrl = controllerPhotoUrl.text;

            await httpHelper.createPublication(title, description, tags, photoUrl, content, 1);
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
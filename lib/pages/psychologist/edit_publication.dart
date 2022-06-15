// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:psychohelp_app/models/publication.dart';
import 'package:psychohelp_app/utils/http_helper.dart';

class EditedPublication extends StatefulWidget {
  const EditedPublication(this.publication);
  final Publication publication;

  @override
  State<EditedPublication> createState() => _EditedPublicationState();
}

class _EditedPublicationState extends State<EditedPublication> {
  HttpHelper httpHelper = HttpHelper();
  Publication? publication;

  final TextEditingController controllerTitle = TextEditingController();
  final TextEditingController controllerDescription = TextEditingController();
  final TextEditingController controllerTags = TextEditingController();
  final TextEditingController controllerContent = TextEditingController();
  final TextEditingController controllerPhotoUrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Edit Publication'),
      ),
      body: getBody(),
    );
  }

  @override
  void initState() {
    httpHelper = HttpHelper();
    controllerTitle.text = widget.publication.title;
    controllerDescription.text = widget.publication.description;
    controllerTags.text = widget.publication.tags;
    controllerContent.text = widget.publication.content;
    controllerPhotoUrl.text = widget.publication.photoUrl;
    super.initState();
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
          controller: controllerTags,
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
        ElevatedButton(
          child: Text('Save'),
          onPressed: () async {
            // ignore: unused_local_variable
            String title = controllerTitle.text;
            // ignore: unused_local_variable
            String description = controllerDescription.text;
            String tags = controllerTags.text;
            String content = controllerContent.text;
            String photoUrl = controllerPhotoUrl.text;
            Publication publicationInfo = Publication(
                id: widget.publication.id,
                title: title,
                description: description,
                tags: tags,
                content: content,
                photoUrl: photoUrl);
            await httpHelper.updatePublication(
                widget.publication.id, publicationInfo);
            Navigator.pop(context, publicationInfo);
          },
        ),
      ],
    );
  }
}

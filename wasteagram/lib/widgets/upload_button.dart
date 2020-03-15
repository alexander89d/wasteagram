import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UploadButton extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final Map<String, dynamic> newPost;

  UploadButton({Key key, this.formKey, this.newPost}) : super(key: key);
  
  @override
  _UploadButtonState createState() => _UploadButtonState();
}

class _UploadButtonState extends State<UploadButton> {
  // TODO: Implement gathering Latitude / Longitude
  // TODO: Figure out how to sort posts from newest to oldest
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: RaisedButton(
            onPressed: () {
              if (widget.formKey.currentState.validate()) {
                widget.formKey.currentState.save();
                widget.newPost['date'] = DateTime.now().toString();
                widget.newPost['latitude'] = '-80.0';
                widget.newPost['longitude'] = '5.8';
                Firestore.instance.collection('posts').add(widget.newPost);
                Navigator.of(context).pop();
              }
            },
            child: Icon(
              Icons.cloud_upload,
              size: 50.0,  
            ),
          ),
        ),
      ],
    );
  }
}
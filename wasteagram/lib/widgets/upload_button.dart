import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:location/location.dart';

class UploadButton extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final Map<String, dynamic> newPost;

  UploadButton({Key key, this.formKey, this.newPost}) : super(key: key);
  
  @override
  _UploadButtonState createState() => _UploadButtonState();
}

class _UploadButtonState extends State<UploadButton> {
  final locationService = Location();
  
  // TODO: Figure out how to sort posts from newest to oldest
  // TODO: Figure out what happens if user denies permission (if time).
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: RaisedButton(
            onPressed: () async {
              if (widget.formKey.currentState.validate()) {
                widget.formKey.currentState.save();
                final locationData = await retrieveLocation();
                if (locationData == null) {
                  return;
                }
                widget.newPost['latitude'] = '${locationData.latitude}';
                widget.newPost['longitude'] = '${locationData.longitude}';
                widget.newPost['date'] = DateTime.now().toString();
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

  Future<LocationData> retrieveLocation() async {
    // CITATION: Code for how to manually check to ensure location service is enabled
    // provided by instructor Nauman Chaudhry in CS 492-400 Winter 2020 Piazza Post @164-f1
    try {
      var _serviceEnabled = await locationService.serviceEnabled();
      if (!_serviceEnabled) {
        _serviceEnabled = await locationService.requestService();
        if (!_serviceEnabled) {
          print('Failed to enable service. Returning.');
          return null;
        }
      }

      var _permissionGranted = await locationService.hasPermission();
      if (_permissionGranted == PermissionStatus.DENIED) {
        _permissionGranted = await locationService.requestPermission();
        if (_permissionGranted != PermissionStatus.GRANTED) {
          print('Location service permission not granted. Returning.');
        }
      }

      final locationData = await locationService.getLocation();
      return locationData;
    } on PlatformException catch (e) {
      print('Error: ${e.toString()}, code: ${e.code}');
      return null;
    }
  }
}
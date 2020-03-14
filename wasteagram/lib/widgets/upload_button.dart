import 'package:flutter/material.dart';

class UploadButton extends StatefulWidget {
  final GlobalKey<FormState> formKey;

  UploadButton({Key key, this.formKey});
  
  @override
  _UploadButtonState createState() => _UploadButtonState();
}

class _UploadButtonState extends State<UploadButton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: RaisedButton(
            onPressed: () {
              if (widget.formKey.currentState.validate()) {
                widget.formKey.currentState.save();
                // Here is where data would be passed to database,
                // passing donutFormFields object.
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
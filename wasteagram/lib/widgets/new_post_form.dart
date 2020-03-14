import 'package:flutter/material.dart';
import 'upload_button.dart';

class NewPostDTO {
  DateTime date;
  String imageURL;
  int quantity;
  double latitude;
  double longitude;
}

class NewPostForm extends StatefulWidget {
  @override
  _NewPostFormState createState() => _NewPostFormState();
}

class _NewPostFormState extends State<NewPostForm> {
  final formKey = GlobalKey<FormState>();
  final newPost = NewPostDTO();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 10),
          TextFormField(
            keyboardType: TextInputType.number,
            autofocus: true,
            decoration: InputDecoration(
              labelText: 'Number of Items',
              border: OutlineInputBorder(),
            ),
            onSaved: (value) {
              newPost.quantity = int.parse(value);
            },
            validator: _quantityValidator,
          ),
          SizedBox(height: 10),
          UploadButton(formKey: formKey),
        ],
      ),
    );
  }

  String _quantityValidator(String value) {
    if (value.isEmpty) {
      return 'Please enter the number of items wasted.';
    } else {
      try {
        if (int.parse(value) < 0) {
          return 'The number of items wasted cannot be negative.';
        } else {
          return null;
        }
      }
      on FormatException {
        return 'The number of items wasted must be a whole number.';
      }
    }
  }
}
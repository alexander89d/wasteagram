import 'package:flutter/material.dart';
import 'image_limited_box.dart';
import 'upload_button.dart';

class NewPostForm extends StatefulWidget {
  final String imageURL;

  NewPostForm({Key key, this.imageURL}) : super(key: key);
  
  @override
  _NewPostFormState createState() => _NewPostFormState();
}

class _NewPostFormState extends State<NewPostForm> {
  final formKey = GlobalKey<FormState>();
  final Map<String, dynamic> newPost = {};

  @override
  void initState() {
    super.initState();
    newPost['imageURL'] = widget.imageURL;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Semantics(
            image: true,
            label: 'Wasted food.',
            child: ImageLimitedBox(
              imageURL: widget.imageURL,
              portraitMaxHeightFactor: 0.5,
              landscapeMaxHeightFactor: 0.5,
            ),
          ),
          SizedBox(height: 50),
          Semantics(
            textField: true,
            label: 'Number of items wasted.',
            child: TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Number of Items',
                border: OutlineInputBorder(),
              ),
              onSaved: (value) {
                newPost['quantity'] = int.parse(value);
              },
              validator: _quantityValidator,
            ),
          ),
          SizedBox(height: 50),
          UploadButton(formKey: formKey, newPost: newPost),
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
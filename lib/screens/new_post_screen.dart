import 'package:flutter/material.dart';
import '../widgets/new_post_form.dart';
import '../widgets/wasteagram_scaffold.dart';

class NewPostScreen extends StatelessWidget {
  final String imageURL;

  NewPostScreen({Key key, this.imageURL}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return WasteagramScaffold(
      title: Text('Wasteagram'), 
      body: Center(
        child: FractionallySizedBox(
          widthFactor: 0.9,
          heightFactor: 0.9,
          child: SingleChildScrollView(
            child: NewPostForm(imageURL: imageURL),
          ),
        ),
      ),
    );
  }
}
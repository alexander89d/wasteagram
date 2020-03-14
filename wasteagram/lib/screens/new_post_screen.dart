import 'package:flutter/material.dart';
import '../widgets/new_post_form.dart';
import '../widgets/wasteagram_scaffold.dart';

class NewPostScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WasteagramScaffold(
      title: 'Wasteagram', 
      body: Center(
        child: FractionallySizedBox(
          widthFactor: 0.9,
          heightFactor: 0.9,
          child: SingleChildScrollView(
            child: NewPostForm(),
          ),
        ),
      ),
    );
  }
}
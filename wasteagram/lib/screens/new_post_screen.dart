import 'package:flutter/material.dart';
import '../widgets/wasteagram_scaffold.dart';

class NewPostScreen extends StatefulWidget {
  @override
  _NewPostScreenState createState() => _NewPostScreenState();
}

class _NewPostScreenState extends State<NewPostScreen> {
  @override
  Widget build(BuildContext context) {
    return WasteagramScaffold(
      title: 'Wasteagram', 
      body: Center(
        child: Text(
          'Add New Entry',
          style: Theme.of(context).textTheme.display1,
        ),
      ),
    );
  }
}
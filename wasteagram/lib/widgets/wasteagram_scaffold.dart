import 'package:flutter/material.dart';

class WasteagramScaffold extends StatelessWidget {
  static const title = 'Wasteagram';
  final List<Widget> actions;
  final Widget body;

  WasteagramScaffold({Key key, this.actions, this.body}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: actions,
      ),
      body: body,
    );
  }
}
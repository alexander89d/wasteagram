import 'package:flutter/material.dart';

class WasteagramScaffold extends StatelessWidget {
  final String title;
  final Widget body;
  final FloatingActionButton fab;

  WasteagramScaffold({
    Key key, 
    @required this.title, 
    @required this.body, 
    this.fab
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: body,
      floatingActionButton: fab,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
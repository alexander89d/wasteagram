import 'package:flutter/material.dart';

class WasteagramScaffold extends StatelessWidget {
  final Widget title;
  final Widget body;
  final Widget fab;

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
        title: title,
        centerTitle: true,
      ),
      body: body,
      floatingActionButton: fab,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
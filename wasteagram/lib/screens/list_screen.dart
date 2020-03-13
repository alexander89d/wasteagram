import 'package:flutter/material.dart';
import '../widgets/wasteagram_scaffold.dart';

class ListScreen extends StatefulWidget {
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    return WasteagramScaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
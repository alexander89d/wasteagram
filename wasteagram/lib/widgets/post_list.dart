import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PostList extends StatefulWidget {
  final void Function(int) addToTotalQuantityWasted;

  PostList({Key key, this.addToTotalQuantityWasted}) : super(key: key);
  
  @override
  _PostListState createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  @override
  Widget build(BuildContext context) {
    return Placeholder();
  }
}
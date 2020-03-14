import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/food_waste_post.dart';

class PostList extends StatefulWidget {
  final void Function(int) addToTotalQuantityWasted;
  PostList({Key key, this.addToTotalQuantityWasted}) : super(key: key);
  
  @override
  _PostListState createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Firestore.instance.collection('posts').snapshots(),
      builder: (context, snapshot) {
        if(snapshot.hasData && snapshot.data.documents != null && snapshot.data.documents.length > 0) {
          return ListView.builder(
            itemCount: snapshot.data.documents.length,
            itemBuilder: (context, index) {
              final post = FoodWastePost.fromMap(snapshot.data.documents[index]);
              //widget.addToTotalQuantityWasted(post['quantity']);
              return ListTile(
                title: Text('${post.formattedDateWithoutYear}'),
                trailing: Text('${post.quantity}'),
              );
            }
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      }
    );
  }
}
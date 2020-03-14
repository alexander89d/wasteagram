import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/food_waste_post.dart';
import '../screens/post_detail_screen.dart';

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
                trailing: Container(
                  decoration: BoxDecoration(
                    border: Border.all(),
                    shape: BoxShape.circle,
                  ),
                  padding: EdgeInsets.all(12),
                  child: Text('${post.quantity}'),
                ),
                onTap: () {
                  _pushDetailScreen(context, post);
                },
              );
            }
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      }
    );
  }

  void _pushDetailScreen(BuildContext context, FoodWastePost post) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (context) {
          return DetailScreen(
            post: post,
          );
        }
      ),
    );
  }
}
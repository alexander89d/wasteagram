import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MainPageTitle extends StatefulWidget {
  @override
  _MainPageTitleState createState() => _MainPageTitleState();
}

class _MainPageTitleState extends State<MainPageTitle> {
 @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Firestore.instance.collection('posts').snapshots(),
      builder: (context, snapshot) {
        if(snapshot.hasData && snapshot.data.documents != null && snapshot.data.documents.length > 0) {
          var totalQuantityWasted = 0;
          snapshot.data.documents.forEach( (post) {
            totalQuantityWasted += post['quantity'];
          });
          return Semantics(
            label: 'Number at end of title represents total number of items wasted accross all posts',
            child: Text('Wasteagram - $totalQuantityWasted'),
          );
        } else {
          return Text('Wasteagram');
        }
      }
    );
  }
}
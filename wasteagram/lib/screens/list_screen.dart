import 'package:flutter/material.dart';
import '../screens/new_post_screen.dart';
import '../widgets/main_page_title.dart';
import '../widgets/post_list.dart';
import '../widgets/wasteagram_scaffold.dart';

class ListScreen extends StatefulWidget {
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    return WasteagramScaffold(
      title: MainPageTitle(),
      body: PostList(),
      fab: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute<void>(
              builder: (context) {
                return NewPostScreen();
              }
            ),
          );
        },
      ),
    );
  }
}
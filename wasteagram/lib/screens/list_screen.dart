import 'package:flutter/material.dart';
import '../screens/new_post_screen.dart';
import '../widgets/post_list.dart';
import '../widgets/wasteagram_scaffold.dart';

class ListScreen extends StatefulWidget {
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  int totalQuantityWasted;

  // TODO: Implement updating totalQuantityWasted.

  @override
  void initState() {
    super.initState();
    totalQuantityWasted = 0;
  }
  
  void addToTotalQuantityWasted(int quantity) {
    setState(() {
      totalQuantityWasted += quantity;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return WasteagramScaffold(
      title: 'Wasteagram - $totalQuantityWasted',
      body: PostList(
        addToTotalQuantityWasted: addToTotalQuantityWasted,
      ),
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
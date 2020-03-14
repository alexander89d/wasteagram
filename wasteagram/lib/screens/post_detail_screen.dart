import 'package:flutter/material.dart';
import '../models/food_waste_post.dart';
import '../widgets/wasteagram_scaffold.dart';

class DetailScreen extends StatelessWidget {
  final FoodWastePost post;

  DetailScreen({Key key, @required this.post}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return WasteagramScaffold(
      title: 'Wasteagram', 
      body: Center(
        child: FractionallySizedBox(
          widthFactor: 0.9,
          heightFactor: 0.9,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  post.formattedDateWithYear,
                  style: Theme.of(context).textTheme.headline,
                ),
                SizedBox(height: 20.0),
                SizedBox(height: 300.0, child: Placeholder()),
                SizedBox(height: 20),
                Text(
                  'Items: ${post.quantity}',
                  style: Theme.of(context).textTheme.headline,
                ),
                SizedBox(height: 20),
                Text(
                  '(${post.latitude}, ${post.longitude})',
                  style: Theme.of(context).textTheme.headline,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
import 'package:intl/intl.dart';

class FoodWastePost {
  final DateTime date;
  final String imageURL;
  final int quantity;
  final double latitude;
  final double longitude;
  static final DateFormat _dateFormatWithYear = DateFormat('EEEE, MMMM d, yyyy');
  static final DateFormat _dateFormatWithoutYear = DateFormat('EEEE, MMMM d');

  FoodWastePost({this.date, this.imageURL, this.quantity, this.latitude, this.longitude});

  factory FoodWastePost.fromMap(dynamic postData) {
    return FoodWastePost(
      date: DateTime.fromMillisecondsSinceEpoch(postData['date'].millisecondsSinceEpoch),
      imageURL: postData['imageURL'],
      quantity: postData['quantity'],
      latitude: double.parse(postData['latitude']),
      longitude: double.parse(postData['longitude']),
    );
  }

  String get formattedDateWithYear => _dateFormatWithYear.format(date);

  String get formattedDateWithoutYear => _dateFormatWithoutYear.format(date);
}
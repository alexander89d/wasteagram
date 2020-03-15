import 'package:flutter_test/flutter_test.dart';
import 'package:wasteagram/models/food_waste_post.dart';

void main() {
  test('Post created from map should have appropriate values', () {
    final date = DateTime.parse('2020-02-04');
    final imageURL = 'www.somewebsite.com';
    final quantity = 50;
    final latitude = 75.2;
    final longitude = 28.3;

    final post = FoodWastePost.fromMap({
      'date': date.toString(),
      'imageURL': imageURL,
      'quantity': quantity,
      'latitude': latitude.toString(),
      'longitude': longitude.toString(),
    });

    expect(post.date, date);
    expect(post.imageURL, imageURL);
    expect(post.quantity, quantity);
    expect(post.latitude, latitude);
    expect(post.longitude, longitude);
  });

  test('Formatted date with year matches expected format.', () {
    final post = FoodWastePost(
      date: DateTime.parse('2020-02-02'),
      imageURL: 'www.anotherwebsite.com',
      quantity: 80,
      latitude: -5.5,
      longitude: 0,
    );

    const formatExpected = 'Sunday, February 2, 2020';
    final actualFormat = post.formattedDateWithYear;

    expect(actualFormat, formatExpected);
  });

  test('Formatted date without year matches expected format.', () {
    final post = FoodWastePost(
      date: DateTime.parse('2020-02-02'),
      imageURL: 'www.anotherwebsite.com',
      quantity: 80,
      latitude: -5.5,
      longitude: 0,
    );

    const formatExpected = 'Sunday, February 2';
    final actualFormat = post.formattedDateWithoutYear;

    expect(actualFormat, formatExpected);
  });
}
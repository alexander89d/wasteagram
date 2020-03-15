import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import '../screens/new_post_screen.dart';
import '../widgets/main_page_title.dart';
import '../widgets/post_list.dart';
import '../widgets/wasteagram_scaffold.dart';

class ListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WasteagramScaffold(
      title: MainPageTitle(),
      body: PostList(),
      fab: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          final imageURL = await _chooseImage();
          if (imageURL != null) {
            _pushNewPostScreen(context, imageURL);
          }
        },
      ),
    );
  }

  Future<String> _chooseImage() async {
    final imageFile = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (imageFile == null) {
      return null;
    }
    final storageReference =
      FirebaseStorage.instance.ref().child(DateTime.now().toString());
    final uploadTask = storageReference.putFile(imageFile);
    await uploadTask.onComplete;
    final String imageURL = await storageReference.getDownloadURL();
    return imageURL;
  }

  void _pushNewPostScreen(BuildContext context, String imageURL) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (context) {
          return NewPostScreen(imageURL: imageURL);
        }
      ),
    );
  }
}
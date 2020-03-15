import 'package:flutter/material.dart';

class ImageLimitedBox extends StatelessWidget {
  final double portraitMaxHeightFactor;
  final double portraitMaxWidthFactor;
  final double landscapeMaxHeightFactor;
  final double landscapeMaxWidthFactor;
  final String imageURL;
  
  ImageLimitedBox({
    Key key,
    this.portraitMaxHeightFactor, 
    this.portraitMaxWidthFactor, 
    this.landscapeMaxHeightFactor,
    this.landscapeMaxWidthFactor,
    @required this.imageURL
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LimitedBox(
      maxHeight: _calculateMaxHeight(context),
      maxWidth: _calculateMaxWidth(context),
      child: Image.network(imageURL),
    );
  }

  double _calculateMaxHeight(BuildContext context) {
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      if (portraitMaxHeightFactor == null) {
        return double.infinity;
      }
      return portraitMaxHeightFactor * MediaQuery.of(context).size.height;
    } else {
      if (landscapeMaxHeightFactor == null) {
        return double.infinity;
      }
      return landscapeMaxHeightFactor * MediaQuery.of(context).size.height;
    }
  }

  double _calculateMaxWidth(BuildContext context) {
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      if (portraitMaxWidthFactor == null) {
        return double.infinity;
      }
      return portraitMaxWidthFactor * MediaQuery.of(context).size.height;
    } else {
      if (landscapeMaxWidthFactor == null) {
        return double.infinity;
      }
      return landscapeMaxWidthFactor * MediaQuery.of(context).size.height;
    }
  }
}
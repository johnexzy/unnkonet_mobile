import 'package:flutter/material.dart';

class ImageBanner extends StatelessWidget {
  final String _assetPath;
  final double topR;
  final double bottomR;
  ImageBanner(this._assetPath, this.topR, this.bottomR);
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(
        height: 200.0,
      ),
      decoration: BoxDecoration(
          // shape: BoxShape.circle,
          color: Color.fromARGB(
            255,
            49,
            5,
            131,
          ),
          borderRadius: BorderRadius.vertical(
              top: Radius.circular(topR), bottom: Radius.circular(bottomR))),
      child: Image(
        image: NetworkImage(_assetPath),
        fit: BoxFit.cover,
        filterQuality: FilterQuality.low,
        loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent loadingProgress) {
           if (loadingProgress == null)
             return child;
          return Center(
            child: CircularProgressIndicator(
               value: loadingProgress.expectedTotalBytes != null
                   ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes
                   : null,
             ),
           );
         },
       ),
      );
  }
}

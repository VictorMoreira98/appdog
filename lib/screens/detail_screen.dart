import 'package:appdog/widget/item/dog_item.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final String image;
  final int indexImage;
  const DetailScreen({Key key, this.image, this.indexImage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.3),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Hero(
            tag: "dogHero${this.indexImage}",
              child: Center(
                  child: DogItem(
            imageDog: image,
            heigth: 0.4,
            width: 0.6,
          )),
           transitionOnUserGestures: true
           ),
        ],
      ),
    );
  }
}

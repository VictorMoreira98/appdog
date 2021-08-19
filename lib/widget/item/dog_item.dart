import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class DogItem extends StatelessWidget {
  final String imageDog;
  final double heigth;
  final double width;
  const DogItem({Key key, this.imageDog, this.heigth, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.brown[200],
          borderRadius: BorderRadius.circular(10)),
      height: MediaQuery.of(context).size.height * heigth,
      width: MediaQuery.of(context).size.width * width,
      child: FittedBox(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: CachedNetworkImage(
            placeholder: (context, url) => new Container(
              color: Colors.transparent,
            ),
            imageUrl:
                imageDog,
          ),
        ),
        fit: BoxFit.fill,
      ),
    );
  }
}

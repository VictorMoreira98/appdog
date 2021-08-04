import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class DogItem extends StatelessWidget {
  final String imageDog;
  const DogItem({Key key, this.imageDog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.brown[200],
              borderRadius: BorderRadius.circular(10)),
          height: MediaQuery.of(context).size.height * 0.2,
          width: MediaQuery.of(context).size.width * 0.4,
          child: CachedNetworkImage(
            height: 80,
            width: 80,
            placeholder: (context, url) => new Container(
              color: Colors.transparent,
            ),
            imageUrl:
                imageDog,
          ),
        ),
      ],
    );
  }
}

import 'dart:math';

import 'package:appdog/screens/detail_screen.dart';
import 'package:appdog/store/dog-api.dart';
import 'package:appdog/widget/item/dog_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DogAPIStore _dogAPIStore;
  Random random;
  String _currentDog;

  @override
  void initState() {
    super.initState();
    random = new Random();
    _dogAPIStore = GetIt.instance<DogAPIStore>();
    if (_dogAPIStore.dogAPI == null || _dogAPIStore.dogAPIBreads == null) {
      var idDog = random.nextInt(_dogAPIStore.dogAPIBreads.length);
      _currentDog = _dogAPIStore.dogAPIBreads[idDog];
      _dogAPIStore.fetchDogList(idDog);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.brown,
          title: Center(child: Text('AppDog')),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                child: Ink(
                  width: 100,
                  height: 70,
                  decoration: BoxDecoration(
                      color: Colors.brown[200],
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(child: Observer(builder: (_) {
                    return Text(
                      _dogAPIStore.currentBread,
                      style: TextStyle(color: Colors.white),
                    );
                  })),
                ),
                onTap: () => {
                  _dogAPIStore.fetchDogList(
                      random.nextInt(_dogAPIStore.dogAPIBreads.length)),
                },
                borderRadius: BorderRadius.circular(10),
                splashColor: Colors.brown,
              ),
            ),
            Expanded(
              child: Observer(
                  name: 'ListDogHomeScreen',
                  builder: (BuildContext context) {
                    return _dogAPIStore.dogAPI != null
                        ? AnimationLimiter(
                            child: GridView.builder(
                                physics: BouncingScrollPhysics(),
                                padding: EdgeInsets.all(12),
                                addAutomaticKeepAlives: true,
                                gridDelegate:
                                    new SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2),
                                itemCount: _dogAPIStore.dogAPI.message.length,
                                itemBuilder: (context, index) {
                                  return AnimationConfiguration.staggeredGrid(
                                    position: index,
                                    duration: const Duration(milliseconds: 375),
                                    columnCount: 2,
                                    child: ScaleAnimation(
                                      child: InkWell(
                                        child: Hero(
                                          tag: "dogHero${index}",
                                          child: Column(
                                            children: [
                                              DogItem(
                                                imageDog: _dogAPIStore
                                                    .dogAPI.message[index]
                                                    .toString(),
                                                heigth: 0.2,
                                                width: 0.4,
                                              ),
                                            ],
                                          ),
                                          transitionOnUserGestures: true,
                                        ),
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              CustomPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        DetailScreen(
                                                          image: _dogAPIStore
                                                              .dogAPI
                                                              .message[index]
                                                              .toString(),
                                                          indexImage: index,
                                                        ),
                                                fullscreenDialog: true,
                                              ));
                                        },
                                      ),
                                    ),
                                  );
                                }),
                          )
                        : Center(child: CircularProgressIndicator());
                  }),
            ),
          ],
        ));
  }
}

class CustomPageRoute extends MaterialPageRoute {
  @override
  Duration get transitionDuration => const Duration(milliseconds: 600);

  CustomPageRoute({builder, fullscreenDialog})
      : super(builder: builder, fullscreenDialog: fullscreenDialog);
}

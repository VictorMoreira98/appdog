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
  @override
  void initState() {
    super.initState();
    _dogAPIStore = GetIt.instance<DogAPIStore>();
    if (_dogAPIStore.dogAPI == null) {
      _dogAPIStore.fetchPokemonList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.brown,
          title: Center(child: Text('AppDog')),
        ),
        body: Observer(
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
                                child: DogItem(
                                  imageDog: _dogAPIStore.dogAPI.message[index]
                                      .toString(),
                                ),
                              ),
                            );
                          }),
                    )
                  : Center(child: CircularProgressIndicator());
            }));
  }
}

import 'dart:convert';
import 'package:appdog/consts/consts-api.dart';
import 'package:mobx/mobx.dart';
import 'package:appdog/models/dog-model.dart';
import 'package:http/http.dart' as http;
part 'dog-api.g.dart';

class DogAPIStore = _DogAPIStoreBase with _$DogAPIStore;

abstract class _DogAPIStoreBase with Store {
  @observable
  Dog _dogAPI;

  @observable
  List<String> _dogAPIBreads = ConstsAPI.BREADS;

 @observable
 String _currentBread;

  @computed
  Dog get dogAPI => _dogAPI;

  @computed
  String get currentBread => _currentBread;

  @computed
  List<String> get dogAPIBreads => _dogAPIBreads;

  @action
  fetchDogList(id) {
    _dogAPI = null;
    _currentBread = _dogAPIBreads[id];
    loadDogAPI(id).then((dogList) {
      _dogAPI = dogList;
    });
  }

  Future<Dog> loadDogAPI(id) async {
    try {
      final response = await http.get('${ConstsAPI.API}/${_dogAPIBreads[id]}/images');
      var decodeJson = jsonDecode(response.body);
      return Dog.fromJson(decodeJson);
    } catch (error, stacktrace) {
      print("Erro ao carregar lista" + stacktrace.toString());
      return null;
    }
  }
}

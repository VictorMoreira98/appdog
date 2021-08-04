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

  @computed
  Dog get dogAPI => _dogAPI;

  @action
  fetchPokemonList() {
    _dogAPI = null;
    loadDogAPI().then((dogList) {
      print(dogList);
      _dogAPI = dogList;
    });
  }

  Future<Dog> loadDogAPI() async {
    try {
      final response = await http.get(ConstsAPI.API);
      var decodeJson = jsonDecode(response.body);
      return Dog.fromJson(decodeJson);
    } catch (error, stacktrace) {
      print("Erro ao carregar lista" + stacktrace.toString());
      return null;
    }
  }
}

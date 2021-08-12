// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dog-api.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DogAPIStore on _DogAPIStoreBase, Store {
  Computed<Dog> _$dogAPIComputed;

  @override
  Dog get dogAPI => (_$dogAPIComputed ??=
          Computed<Dog>(() => super.dogAPI, name: '_DogAPIStoreBase.dogAPI'))
      .value;
  Computed<String> _$currentBreadComputed;

  @override
  String get currentBread =>
      (_$currentBreadComputed ??= Computed<String>(() => super.currentBread,
              name: '_DogAPIStoreBase.currentBread'))
          .value;
  Computed<List<String>> _$dogAPIBreadsComputed;

  @override
  List<String> get dogAPIBreads => (_$dogAPIBreadsComputed ??=
          Computed<List<String>>(() => super.dogAPIBreads,
              name: '_DogAPIStoreBase.dogAPIBreads'))
      .value;

  final _$_dogAPIAtom = Atom(name: '_DogAPIStoreBase._dogAPI');

  @override
  Dog get _dogAPI {
    _$_dogAPIAtom.reportRead();
    return super._dogAPI;
  }

  @override
  set _dogAPI(Dog value) {
    _$_dogAPIAtom.reportWrite(value, super._dogAPI, () {
      super._dogAPI = value;
    });
  }

  final _$_dogAPIBreadsAtom = Atom(name: '_DogAPIStoreBase._dogAPIBreads');

  @override
  List<String> get _dogAPIBreads {
    _$_dogAPIBreadsAtom.reportRead();
    return super._dogAPIBreads;
  }

  @override
  set _dogAPIBreads(List<String> value) {
    _$_dogAPIBreadsAtom.reportWrite(value, super._dogAPIBreads, () {
      super._dogAPIBreads = value;
    });
  }

  final _$_currentBreadAtom = Atom(name: '_DogAPIStoreBase._currentBread');

  @override
  String get _currentBread {
    _$_currentBreadAtom.reportRead();
    return super._currentBread;
  }

  @override
  set _currentBread(String value) {
    _$_currentBreadAtom.reportWrite(value, super._currentBread, () {
      super._currentBread = value;
    });
  }

  final _$_DogAPIStoreBaseActionController =
      ActionController(name: '_DogAPIStoreBase');

  @override
  dynamic fetchDogList(dynamic id) {
    final _$actionInfo = _$_DogAPIStoreBaseActionController.startAction(
        name: '_DogAPIStoreBase.fetchDogList');
    try {
      return super.fetchDogList(id);
    } finally {
      _$_DogAPIStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
dogAPI: ${dogAPI},
currentBread: ${currentBread},
dogAPIBreads: ${dogAPIBreads}
    ''';
  }
}

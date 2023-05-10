import 'package:flutter/material.dart';
import 'package:marvel_app/services/api_services.dart';

import 'package:marvel_app/models/character_model.dart';

class CharacterProvider extends ChangeNotifier {
  List<Char> _characterList = [];
  int limit = 20;
  int offset = 0;
  bool isLoading = false;

  CharacterProvider(){
    getCharacters();
  }

  List<Char> get characterList => _characterList;
 

  Future<void> getCharacters() async {

    final response = await ApiServices.api.getCharacters( offset, limit);
    _characterList = [...response];
    offset += limit;
    
    notifyListeners();
  }

  Future<void> loadMoreCharacters() async {

    await getCharacters();
    isLoading = false;

    // notifyListeners();
  }

}
import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:marvel_app/models/models.dart';


class ApiServices {
  static final ApiServices api = ApiServices._();
  ApiServices._();
  final Dio _dio = Dio();

  // static headers
  static const publicKey = '4480397f7e30607e80026af8c540a8d4';
  static const privateKey = '2e17039f2924e37458fae9dc6320eb87c900c8ac';
  static const baseUrl = 'https://gateway.marvel.com:443/v1/public/characters';

  // Generate dynamic hash
  static String generateHash(String timeStamp, String private, String public){
    final bytes = utf8.encode('$timeStamp$private$public');
    final hash = md5.convert(bytes);
    return hash.toString();
  }

  // generate TimeStamp
    // final timeStamp = DateTime.now().millisecondsSinceEpoch.toString();


  List<Char> characterList = [];

  String generateMd5(String input) {
    return md5.convert(utf8.encode(input)).toString();
  }

  // api calls
  Future<List<Char>>getCharacters(int offset, int limit ) async {
    final timeStamp = DateTime.now().microsecondsSinceEpoch.toString();
    final hash = generateHash(timeStamp, privateKey, publicKey);

    final response = await _dio.get(baseUrl, queryParameters: {
      'apikey' : publicKey,
      'hash'   : hash,
      'ts'     : timeStamp,
      'offset' : offset,
      'limit'  : limit
    });

    final newResponse = CharactersModel.fromJson(response.data);
    characterList.addAll(newResponse.data.results);
    return characterList;
    // final data = charactersModelFromJson(response.data);
    // return data.results;
  }

  Future getCharacterComic() async {}
  Future getCharacterEvents() async {}
  Future getCharacterSeries() async {}
  Future getCharacterStories() async {}

}
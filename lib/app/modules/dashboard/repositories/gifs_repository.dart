import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:test_sumer/app/modules/dashboard/models/git_model.dart';

class GifRepository {
  Future<List<GifModel>> getRandomGif() async {
    log('sdfsdfsdfsdf');
    try {
      final response = await Dio().get(
          'https://api.giphy.com/v1/gifs/trending?api_key=XDuWe9CsDj1KNm19U6bXViGEq3z17ZuX&limit=25&rating=g');
      log('sdfsdfsdfsdf $response');

      return response.data['data']
          .map<GifModel>((d) => GifModel.fromMap(d))
          .toList();
    } catch (e) {
      throw Exception();
    }
  }

  Future<List<GifModel>> searchGif(String value) async {
    try {
      final response = await Dio().get(
          'https://api.giphy.com/v1/gifs/search?api_key=XDuWe9CsDj1KNm19U6bXViGEq3z17ZuX&q=$value&limit=25&offset=0&rating=g&lang=en');
      return response.data['data']
          .map<GifModel>((d) => GifModel.fromMap(d))
          .toList();
    } on DioError catch (e) {
      print(e);
      throw Exception();
    }
  }
}

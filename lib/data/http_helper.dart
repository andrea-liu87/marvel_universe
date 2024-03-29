import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart' as crypto;
import 'package:flutter/material.dart';
import 'package:marvel_universe/model/comic_char.dart';

class HttpHelper {
  final String baseUrl = 'gateway.marvel.com';
  final String apiKey = 'ca13f01a5d29172836248a44bab2e355';
  final String privateKey = '6b2b722ebc3365416c39442f28fdb2c347ad4f9e';
  Dio dio = Dio();

  String getHash(int timestamp) {
    return crypto.md5
        .convert(utf8.encode('$timestamp$privateKey$apiKey'))
        .toString();
  }

  Future<List<ComicChar>> getData() async {
    List<ComicChar> listChar = [];
    int totalElements = 0;
    int currentElements = 0;

    totalElements = await getTotalElements();
    while(currentElements < totalElements){
      listChar.addAll(await get100Data(currentElements));
      currentElements += 100;
    }
    return listChar;
  }

  Future<int> getTotalElements() async {
    int totalElements = 0;
    int timestamp = DateTime.now().millisecondsSinceEpoch;
    Uri url = Uri.https(baseUrl, '/v1/public/characters', {
      'apikey': apiKey,
      'hash': getHash(timestamp),
      'ts': '$timestamp',
      'limit': '20'
    });

    Response response = await dio.get(url.toString());
    if (response.statusCode == 200) {
      var jsonResponse = response.data;
      var data = jsonResponse['data'] as Map<String, dynamic>;
      totalElements = data['total'];
    } else {
      print(
          'Request failed with status: ${response.statusCode} ${response.data}');
    }
    return totalElements;
  }

  Future<List<ComicChar>> get100Data(int offset) async {
    List<ComicChar> listChar = [];
    int timestamp = DateTime.now().millisecondsSinceEpoch;
    Uri url = Uri.https(baseUrl, '/v1/public/characters', {
      'apikey': apiKey,
      'hash': getHash(timestamp),
      'ts': '$timestamp',
      'offset': offset.toString(),
      'limit': '100'
    });

    dio.interceptors.add(DioCacheManager(CacheConfig(baseUrl: baseUrl)).interceptor);
    Response response = await dio.get(url.toString(), options: buildCacheOptions(
        const Duration(days: 7), //duration of cache
        forceRefresh: true, //to force refresh
        maxStale: const Duration(days: 10),
    ));

    if (response.statusCode == 200) {
      var jsonResponse = response.data;
      var data = jsonResponse['data'] as Map<String, dynamic>;
      List<dynamic> results = data['results'];
      for (Map<String, dynamic> result in results) {
        ComicChar char = ComicChar.fromMapToModel(result);
        listChar.add(char);
      }
    } else {
      print(
          'Request failed with status: ${response.statusCode} ${response.data}');
    }
    return listChar;
  }

  Future<void> getThumbnail(String thumbnailUrl) async {
    int timestamp = DateTime.now().millisecondsSinceEpoch;
    Uri url = Uri.https(baseUrl, '/v1/public/characters',
        {'apikey': apiKey,
          'hash': getHash(timestamp),
          'ts': '$timestamp'});

    dio.interceptors.add(DioCacheManager(CacheConfig(baseUrl: baseUrl)).interceptor);
    Response response = await dio.get(url.toString(), options: buildCacheOptions(
      const Duration(days: 7), //duration of cache
      forceRefresh: true, //to force refresh
      maxStale: const Duration(days: 10),
    ));

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.data) as Map<String, dynamic>;
      var data = jsonResponse['data'] as Map<String, dynamic>;
      List<dynamic> results = data['results'];
      for (Map<String, dynamic> result in results) {
        print(result['name']);
      }
    } else {
      print(
          'Request failed with status: ${response.statusCode} ${response.data}');
    }
  }
}

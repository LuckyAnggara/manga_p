import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quizapp/models/detail_model.dart';
import 'package:quizapp/models/home_premium_model.dart';
import 'package:quizapp/models/latest_manga_model.dart';
import 'package:quizapp/models/read_model.dart';

import '../models/manga_type_model.dart';
import '../models/search_model.dart';

class Api {
  static String baseUrl = 'https://apk.nijisan.my.id/';
}

class ApiService {
  static Future<List<HomePremiumModel>> fetchHomePremium() async {
    var response = await http.get(Uri.parse('https://apk.nijisan.my.id/premium/home'));
    if (response.statusCode == 200) {
      var data = response.body;
      return homePremiumModelFromJson(data);
    } else {
      throw Exception();
    }
  }

  static Future<List<MangaTypeModel>> fetchMangaTypeRecommendation(String str) async {
    var response = await http.get(
      Uri.parse('https://apk.nijisan.my.id/filter/komik/rekomendasi/$str/10'),
    );
    if (response.statusCode == 200) {
      var data = response.body;
      return mangaTypeModelFromModel(data);
    } else {
      throw Exception();
    }
  }

  static Future<DetailModel> fetchDetailManga(String linkId) async {
    var response = await http.get(Uri.parse('https://apk.nijisan.my.id/komik/info/$linkId'));
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      return DetailModel.fromJson(data);
    } else {
      throw Exception();
    }
  }

  static Future<ReadModel> readManga(String linkId) async {
    var response = await http.get(Uri.parse('https://apk.nijisan.my.id/komik/baca/$linkId'));
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      return ReadModel.fromJson(data);
    } else {
      throw Exception();
    }
  }

  static Future<List<SearchModel>> searchManga(String keyWord) async {
    var response = await http.get(Uri.parse('https://apk.nijisan.my.id/komik/search/$keyWord'));
    if (response.statusCode == 200) {
      var data = response.body;
      return searchModelFromJson(data);
    } else {
      throw Exception();
    }
  }

  static Future<List<LatestMangaModel>> fetchLatestManga(int newpage) async {
    var response =
        await http.get(Uri.parse('https://apk.nijisan.my.id/premium/home/latest/$newpage/1'));
    if (response.statusCode == 200) {
      var data = response.body;
      return latestMangaFromJson(data);
    } else {
      throw Exception();
    }
  }
}

class PremiumHome {}

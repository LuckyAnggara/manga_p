import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:quizapp/models/favorite_manga_model.dart';

class MangaFavoritesController extends GetxController {
  var isLoading = true.obs;
  List mangaList = <FavoriteMangaModel>[].obs;
  final box = Hive.box('FavoriteBox');

  @override
  void onInit() {
    // TODO: implement onInit
    readAll();
    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    box.close();
  }

  void readAll() {
    try {
      mangaList = box.values.toList();
      isLoading(true);
    } finally {
      isLoading(false);
    }
  }

  void clearAll() {
    box.clear();
    readAll();
  }

  void deleteManga(dynamic data) {
    if (box.containsKey(data)) {
      box.delete(data);
      readAll();
      return;
    }
  }

  void addFavorites(dynamic data) {
    if (box.containsKey(data.linkId)) {
      box.delete(data.linkId);
      return;
    }
    var _favorite = FavoriteMangaModel()
      ..linkId = data.linkId
      ..image = data.image2
      ..title = data.title;
    box.put(data.linkId, _favorite);
    readAll();
  }
}

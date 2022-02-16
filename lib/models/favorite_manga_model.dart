import 'package:hive/hive.dart';

part 'favorite_manga_model.g.dart';

@HiveType(typeId: 0)
class FavoriteMangaModel {
  @HiveField(0)
  String? linkId;

  @HiveField(1)
  String? title;

  @HiveField(2)
  String? image;

  FavoriteMangaModel({
    this.image,
    this.linkId,
    this.title,
  });
}

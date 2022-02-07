import 'package:quizapp/models/chapter_model.dart';

class DetailModel {
  String? linkId;
  String? title;
  String? titleOther;
  String? author;
  String? image;
  String? image2;
  String? rating;
  String? synopsis;
  String? type;
  String? status;
  String? released;
  String? totalChapter;
  String? updatedOn;
  List<String>? genres;
  List<ChapterModel>? listChapter;

  DetailModel({
    this.linkId,
    this.title,
    this.titleOther,
    this.author,
    this.image,
    this.image2,
    this.rating,
    this.synopsis,
    this.type,
    this.status,
    this.released,
    this.totalChapter,
    this.updatedOn,
    this.genres,
    this.listChapter,
  });

  factory DetailModel.fromJson(Map<String, dynamic> json) {
    return DetailModel(
      linkId: json['linkid'],
      title: json['title'],
      titleOther: json['title_other'],
      author: json['author'],
      image: json['image'],
      image2: json['image2'],
      rating: json['rating'],
      synopsis: json['sinopsis'],
      type: json['type'],
      status: json['status'],
      released: json['released'],
      totalChapter: json['total_chapter'],
      updatedOn: json['updated_on'],
      genres: json['genres'] != null ? List.from(json['genres']) : null,
      listChapter: List<ChapterModel>.from(json["list_chapter"].map((chapter) {
        return ChapterModel.fromJson(chapter);
      })),
    );
  }
}

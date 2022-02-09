import 'dart:convert';

List<MangaTypeModel> mangaTypeModelFromModel(String str) =>
    List<MangaTypeModel>.from(
        json.decode(str).map((x) => MangaTypeModel.fromMap(x)));

String mangaTypeModeltoModel(List<MangaTypeModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class MangaTypeModel {
  MangaTypeModel({
    this.title,
    this.chapter,
    this.rating,
    this.image,
    this.image2,
    this.type,
    this.isCompleted,
    this.linkId,
  });

  String? title;
  String? chapter;
  String? rating;
  String? image;
  String? image2;
  String? type;
  String? isCompleted;
  String? linkId;

  factory MangaTypeModel.fromMap(Map<String, dynamic> json) {
    return MangaTypeModel(
      title: json["title"],
      chapter: json["chapter"],
      rating: json["rating"],
      image: json["image"],
      image2: json["image2"],
      type: json["type"],
      isCompleted: json["isCompleted"],
      linkId: json["linkId"],
    );
  }

  Map<String, dynamic> toMap() => {
        "title": title,
        "chapter": chapter,
        "rating": rating,
        "image": image,
        "image2": image2,
        "type": type,
        "isCompleted": isCompleted,
        "linkId": linkId,
      };
}

// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<LatestMangaModel> latestMangaFromJson(String str) {
  var data = json.decode(str);

  return List<LatestMangaModel>.from(
    data['data'].map(
      (x) => LatestMangaModel.fromJson(x),
    ),
  );
}

class LatestMangaModel {
  LatestMangaModel({
    this.title,
    this.ch,
    this.rating,
    this.image,
    this.image2,
    this.type,
    this.isCompleted,
    this.link,
    this.linkId,
    this.isHot,
    this.chId,
    this.chTime,
  });

  String? title;
  String? ch;
  String? rating;
  String? image;
  String? image2;
  String? type;
  String? isCompleted;
  String? link;
  String? linkId;
  String? isHot;
  String? chId;
  String? chTime;

  factory LatestMangaModel.fromJson(Map<String, dynamic> json) => LatestMangaModel(
        title: json["title"],
        ch: json["ch"],
        rating: json["rating"],
        image: json["image"],
        image2: json["image2"],
        type: json["type"],
        isCompleted: json["isCompleted"],
        link: json["link"],
        linkId: json["linkId"],
        isHot: json["isHot"],
        chId: json["ch_id"],
        chTime: json["ch_time"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "ch": ch,
        "rating": rating,
        "image": image,
        "image2": image2,
        "type": type,
        "isCompleted": isCompleted,
        "link": link,
        "linkId": linkId,
        "isHot": isHot,
        "ch_id": chId,
        "ch_time": chTime,
      };
}

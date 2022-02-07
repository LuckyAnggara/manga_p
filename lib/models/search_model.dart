import 'dart:convert';

List<SearchModel> searchModelFromJson(String str) {
  var data = json.decode(str);
  return List<SearchModel>.from(
    data['page'].map(
      (x) => SearchModel.fromJson(x),
    ),
  );
}

class SearchModel {
  String? title;
  String? chapter;
  String? rating;
  String? image;
  String? image2;
  String? type;
  String? isCompleted;
  String? linkId;

  SearchModel({
    this.title,
    this.chapter,
    this.rating,
    this.image,
    this.image2,
    this.type,
    this.isCompleted,
    this.linkId,
  });

  factory SearchModel.fromJson(Map<String, dynamic> json) {
    return SearchModel(
        title: json['title'],
        chapter: json['chapter'],
        rating: json['rating'],
        image: json['image'],
        image2: json['image2'],
        type: json['type'],
        isCompleted: json['isCompleted'],
        linkId: json['linkId']);
  }
}

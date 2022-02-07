import 'dart:convert';

List<HomePremiumModel> homePremiumModelFromJson(String str) {
  var data = json.decode(str);
  return List<HomePremiumModel>.from(
    data['project_komik'].map(
      (x) => HomePremiumModel.fromJson(x),
    ),
  );
}

class HomePremiumModel {
  String? title;
  String? image;
  String? image2;
  String? isHot;
  String? link;
  String? linkId;
  String? ch;
  String? chId;
  String? chTime;

  HomePremiumModel({
    this.title,
    this.image,
    this.image2,
    this.isHot,
    this.link,
    this.linkId,
    this.ch,
    this.chId,
    this.chTime,
  });

  factory HomePremiumModel.fromJson(Map<String, dynamic> json) {
    return HomePremiumModel(
      title: json['title'],
      image: json['image'],
      image2: json['image2'],
      isHot: json['isHot'],
      link: json['link'],
      linkId: json['linkId'],
      ch: json['ch'],
      chId: json['ch_id'],
      chTime: json['ch_time'],
    );
  }
}

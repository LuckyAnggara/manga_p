import 'dart:convert';

List<ChapterModel> chapterModelFromJson(String str) {
  var data = json.decode(str);
  return List<ChapterModel>.from(
    data.map(
      (x) => ChapterModel.fromJson(x),
    ),
  );
}

class ChapterModel {
  String? ch;
  String? timeRelease;
  String? linkId;

  ChapterModel({this.ch, this.linkId, this.timeRelease});

  factory ChapterModel.fromJson(Map<String, dynamic> json) {
    return ChapterModel(
      ch: json['ch'],
      linkId: json['linkId'],
      timeRelease: json['time_release'],
    );
  }
}

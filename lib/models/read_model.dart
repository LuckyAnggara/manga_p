class ReadModel {
  String? title;
  String? ch;
  String? comicTitle;
  String? prevCh;
  String? nextCh;
  String? prevLinkId;
  String? nextLinkId;
  List<String>? images;

  ReadModel({
    this.title,
    this.ch,
    this.comicTitle,
    this.prevCh,
    this.nextCh,
    this.prevLinkId,
    this.nextLinkId,
    this.images,
  });

  factory ReadModel.fromJson(Map<String, dynamic> json){
  	return ReadModel(
		  title: json['title'],
		  ch: json['ch'],
		  comicTitle: json['comic_title'],
		  prevCh: json['prev_ch'],
		  nextCh: json['next_ch'],
		  prevLinkId: json['prev_link_id'],
		  nextLinkId: json['next_link_id'],
		  images: json['images'] != null ? List.from(json['images']) : null,
	  );
  }
}

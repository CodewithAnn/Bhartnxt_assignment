
class ArticleModel {
  int? userId;
  int? id;
  String? title;
  String? body;

  ArticleModel({this.userId, this.id, this.title, this.body});

  ArticleModel.fromJson(Map<String, dynamic> json) {
    if(json["userId"] is int) {
      userId = json["userId"];
    }
    if(json["id"] is int) {
      id = json["id"];
    }
    if(json["title"] is String) {
      title = json["title"];
    }
    if(json["body"] is String) {
      body = json["body"];
    }
  }

  static List<ArticleModel> fromList(List<Map<String, dynamic>> list) {
    return list.map(ArticleModel.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["userId"] = userId;
    _data["id"] = id;
    _data["title"] = title;
    _data["body"] = body;
    return _data;
  }
}
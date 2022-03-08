import 'package:flutter_i/Constants/NewsKey.dart';

class NewsModel {
  final String id;
  final String title;
  final String content;
  final String imagePath;

  NewsModel(this.id, this.title, this.content, this.imagePath);
  NewsModel.fromJson(Map<String, dynamic> json)
      : id = json[news_id_key],
        title = json[news_title_key],
        content = json[news_content_key],
        imagePath = json[news_imagePath_key];
}

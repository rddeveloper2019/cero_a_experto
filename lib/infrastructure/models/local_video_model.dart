import 'dart:convert';

import 'package:cero_a_experto/domain/entities/video_post.dart';

class LocalVideoModel {
  final String name;
  final String videoUrl;
  final int likes;
  final int views;

  LocalVideoModel({
    required this.name,
    required this.videoUrl,
    this.likes = 0,
    this.views = 0,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'videoUrl': videoUrl,
      'likes': likes,
      'views': views,
    };
  }

  factory LocalVideoModel.fromMap(Map<String, dynamic> map) {
    return LocalVideoModel(
      name: map['name'] ?? '',
      videoUrl: map['videoUrl'] ?? '',
      likes: map['likes']?.toInt() ?? 0,
      views: map['views']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory LocalVideoModel.fromJson(String source) => LocalVideoModel.fromMap(json.decode(source));
  VideoPost toVideoPostEntity() {
    return VideoPost(
      caption: name,
      videoUrl: videoUrl,
      likes: likes,
      views: views,
    );
  }
}

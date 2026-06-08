import 'package:cero_a_experto/domain/entities/video_post.dart';
import 'package:cero_a_experto/infrastructure/models/local_video_model.dart';
import 'package:cero_a_experto/shared/data/local_video_posts.dart';
import 'package:flutter/material.dart';

class DiscoverProvider extends ChangeNotifier {
  //TODO: repository
  //TODO: datasource

  bool initialLoading = true;
  final List<VideoPost> videos = [];

  Future<void> loadNextPage() async {
    await Future.delayed(const Duration(seconds: 2));

    final List<VideoPost> newVideos = videoPosts
        .map((map) => LocalVideoModel.fromMap(map).toVideoPostEntity())
        .toList();
    videos.addAll(newVideos);
    initialLoading = false;

    notifyListeners();
  }
}

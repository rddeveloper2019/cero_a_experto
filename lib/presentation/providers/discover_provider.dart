import 'package:cero_a_experto/domain/entities/video_post.dart';
import 'package:flutter/material.dart';

class DiscoverProvider extends ChangeNotifier {
  bool initialLoading = true;
  final List<VideoPost> videos = [];
}

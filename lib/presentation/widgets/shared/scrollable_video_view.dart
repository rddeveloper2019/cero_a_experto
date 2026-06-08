import 'package:cero_a_experto/domain/entities/video_post.dart';
import 'package:cero_a_experto/presentation/widgets/shared/full_screen_player.dart';
import 'package:cero_a_experto/presentation/widgets/shared/video_buttons.dart';
import 'package:flutter/material.dart';

class ScrollableVideoView extends StatelessWidget {
  final List<VideoPost> videos;
  const ScrollableVideoView({
    super.key,
    required this.videos,
  });

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      itemCount: videos.length,
      itemBuilder: (BuildContext context, int index) {
        final videoPost = videos[index];

        return Stack(
          children: [
            //VideoPlayer
            SizedBox.expand(
              child: FullScreenPlayer(
                videoUrl: videoPost.videoUrl,
                caption: videoPost.caption,
              ),
            ),

            //Buttons
            Positioned(
              bottom: 40,
              right: 10,
              child: VideoButtons(
                video: videoPost,
              ),
            ),
          ],
        );
      },
    );
  }
}

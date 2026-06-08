import 'package:animate_do/animate_do.dart';
import 'package:cero_a_experto/config/helpers/human_formats.dart';
import 'package:cero_a_experto/domain/entities/video_post.dart';
import 'package:flutter/material.dart';

class VideoButtons extends StatelessWidget {
  final VideoPost video;

  const VideoButtons({
    super.key,
    required this.video,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _CustomIconButton(
          value: video.likes,
          icon: Icons.favorite,
          color: Colors.red,
        ),
        SizedBox(
          height: 20,
        ),
        _CustomIconButton(
          value: video.views,
          icon: Icons.remove_red_eye_outlined,
        ),
        SizedBox(
          height: 20,
        ),
        SpinPerfect(
          infinite: true,
          duration: Duration(seconds: 5),
          child: _CustomIconButton(
            icon: Icons.play_circle_outline,
          ),
        ),
      ],
    );
  }
}

class _CustomIconButton extends StatelessWidget {
  final int value;
  final IconData icon;
  final Color color;

  const _CustomIconButton({
    super.key,
    required this.icon,
    this.value = 0,
    this.color = Colors.white70,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            icon,
            color: color,
            size: 30,
          ),
        ),
        if (value > 0)
          Text(
            HumanFormats.readableNum(value),
            style: TextStyle(color: Colors.white70),
          ),
      ],
    );
  }
}

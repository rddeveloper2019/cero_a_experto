import 'package:cero_a_experto/presentation/providers/discover_provider.dart';
import 'package:cero_a_experto/presentation/widgets/shared/scrollable_video_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final discoverProvider = context.watch<DiscoverProvider>();

    return Scaffold(
      body: discoverProvider.initialLoading
          ? Center(
              child: const CircularProgressIndicator(
                strokeWidth: 2,
                color: Colors.white70,
              ),
            )
          : ScrollableVideoView(
              videos: discoverProvider.videos,
            ),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:moviebook/common/extensions/string_extension.dart';
import 'package:moviebook/domain/entities/video_entity.dart';
import 'package:moviebook/presentation/journeys/watch_video/watch_video_arguments.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../common/constants/translation_constants.dart';

class WatchVideoScreen extends StatefulWidget {
  final WatchVideoArguments watchVideoArguments;

  const WatchVideoScreen({
    super.key,
    required this.watchVideoArguments,
  });

  @override
  State<WatchVideoScreen> createState() => _WatchVideoScreenState();
}

class _WatchVideoScreenState extends State<WatchVideoScreen> {
  late List<VideoEntity> _videos;
  late YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: '', // Provide a default empty video ID
    flags: const YoutubePlayerFlags(
      autoPlay: true,
      mute: true,
    ),
  );

  @override
  void initState() {
    super.initState();
    _videos = widget.watchVideoArguments.videos;
    if (_videos.isNotEmpty) {
      _controller = YoutubePlayerController(
        initialVideoId: _videos[0].key,
        flags: const YoutubePlayerFlags(
          autoPlay: true,
          mute: true,
        ),
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          TranslationConstants.watchTrailers.t(context),
        ),
      ),
      body: YoutubePlayerBuilder(
        player: YoutubePlayer(
          controller: _controller,
          aspectRatio: 16 / 9,
          showVideoProgressIndicator: true,
          progressIndicatorColor: Colors.amber,
          progressColors: const ProgressBarColors(
            playedColor: Colors.amber,
            handleColor: Colors.amberAccent,
          ),
        ),
        builder: (context, player) {
          return Column(
            children: [
              player,
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      for (int i = 0; i < _videos.length; i++)
                        Container(
                          height: 60,
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            children: <Widget>[
                              GestureDetector(
                                onTap: () {
                                  _controller.load(_videos[i].key);
                                  _controller.play();
                                },
                                child: CachedNetworkImage(
                                  width: 200,
                                  imageUrl: YoutubePlayer.getThumbnail(
                                    videoId: _videos[i].key,
                                    quality: ThumbnailQuality.high,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  child: Text(
                                    _videos[i].title,
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

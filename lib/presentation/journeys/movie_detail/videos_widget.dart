// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:moviebook/common/constants/translation_constants.dart';
// import 'package:moviebook/common/extensions/string_extension.dart';
// import 'package:moviebook/presentation/blocs/videos/videos_bloc.dart';
// import 'package:moviebook/presentation/journeys/watch_video/watch_video_arguments.dart';
// import 'package:moviebook/presentation/journeys/watch_video/watch_video_screen.dart';
// import 'package:moviebook/presentation/widgets/button.dart';

// class VideosWidget extends StatelessWidget {
//   final VideosBloc videosBloc;

//   const VideosWidget({
//     super.key,
//     required this.videosBloc,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder(
//       bloc: videosBloc,
//       builder: (context, state) {
//         if (state is VideosLoaded) {
//           final videos = state.videos;
//           return Button(
//             text: TranslationConstants.watchTrailers.t(context),
//             onPressed: () {
//               Navigator.of(context).push(
//                 MaterialPageRoute(
//                   builder: (context) => WatchVideoScreen(
//                     watchVideoArguments: WatchVideoArguments(videos),
//                   ),
//                 ),
//               );
//             },
//           );
//         } else {
//           return const SizedBox.shrink();
//         }
//       },
//     );
//   }
// }

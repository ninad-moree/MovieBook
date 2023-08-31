import 'package:flutter/material.dart';
import '../../../../domain/entities/movie_entity.dart';
import 'movie_page_view.dart';
import '../../../widgets/movie_app_bar.dart';

class MovieCarouselWidget extends StatelessWidget {
  final List<MovieEntity> movies;
  final int defaultIndex;

  const MovieCarouselWidget({
    super.key,
    required this.movies,
    required this.defaultIndex,
  }) : assert(defaultIndex >= 0, 'default index can\'t be less than 0');

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const MovieAppBar(),
        MoviePageView(
          movies: movies,
          initialPage: defaultIndex,
        ),
      ],
    );
  }
}

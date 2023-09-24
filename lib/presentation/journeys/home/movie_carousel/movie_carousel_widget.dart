import 'package:flutter/material.dart';

import '../../../../domain/entities/movie_entity.dart';
import '../../../widgets/movie_app_bar.dart';
import '../../../widgets/separator.dart';
import 'movie_backdrop_widget.dart';
import 'movie_data_widget.dart';
import 'movie_page_view.dart';

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
    return Stack(
      fit: StackFit.expand,
      children: [
        const MovieBackdropWidget(),
        SingleChildScrollView(
          child: Column(
            children: [
              const MovieAppBar(),
              MoviePageView(
                movies: movies,
                initialPage: defaultIndex,
              ),
              const MovieDataWidget(),
              const SizedBox(height: 5),
              const Seperator(),
            ],
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

import '../../../../domain/entities/movie_entity.dart';
import 'movie_tab_card_widget.dart';

class MovieList extends StatelessWidget {
  final List<MovieEntity> movies;

  const MovieList({
    super.key,
    required this.movies,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.only(top: 5),
      shrinkWrap: true,
      itemCount: movies.length,
      scrollDirection: Axis.horizontal,
      separatorBuilder: (context, index) {
        return const SizedBox(
          width: 8,
        );
      },
      itemBuilder: (context, index) {
        final MovieEntity movie = movies[index];
        return MovieTabCardWidget(
          movieId: movie.id,
          posterPath: movie.posterPath,
          title: movie.title,
          // buildContext: context,
        );
      },
    );
  }
}

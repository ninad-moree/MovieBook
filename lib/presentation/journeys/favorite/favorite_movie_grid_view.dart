import 'package:flutter/material.dart';

import '../../../domain/entities/movie_entity.dart';
import 'favorite_movie_card_widget.dart';

class FavoriteMovieGridWidget extends StatelessWidget {
  final List<MovieEntity> movies;

  const FavoriteMovieGridWidget({
    super.key,
    required this.movies,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: movies.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
          crossAxisSpacing: 20,
        ),
        itemBuilder: (context, index) {
          return FavoriteMovieCardWidget(
            movie: movies[index],
          );
        },
      ),
    );
  }
}

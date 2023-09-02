import 'package:flutter/material.dart';

import 'movie_card_widget.dart';

class AnimatedMovieCard extends StatelessWidget {
  final int index;
  final int movieId;
  final String posterPath;
  final PageController pageController;

  const AnimatedMovieCard({
    super.key,
    required this.index,
    required this.pageController,
    required this.movieId,
    required this.posterPath,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: pageController,
      builder: (context, child) {
        double value = 1;
        if (pageController.position.haveDimensions) {
          value = pageController.page! - index;
          value = (1 - (value.abs() * 0.1)).clamp(0.0, 1.0);
          return Align(
            alignment: Alignment.topCenter,
            child: Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: 15), // Add spacing here
              height: (Curves.easeIn.transform(value.clamp(0.0, 1.0)) * 350)
                  .toDouble(),
              width: 300,
              child: child,
            ),
          );
        } else {
          return Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: const EdgeInsets.symmetric(
                  horizontal: 8.0), // Add spacing here
              height:
                  Curves.easeIn.transform(index == 0 ? value : value * 1) * 350,
              width: 300,
              child: child,
            ),
          );
        }
      },
      child: MovieCardWidget(
        movieId: movieId,
        posterPath: posterPath,
      ),
    );
  }
}

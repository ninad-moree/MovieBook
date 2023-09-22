import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/movie_detail_entity.dart';
import '../../../domain/entities/movie_entity.dart';
import '../../blocs/favorite/favorite_bloc.dart';

class MovieDetailAppbar extends StatelessWidget {
  final MovieDetailEntity movieDetailEntity;

  const MovieDetailAppbar({
    super.key,
    required this.movieDetailEntity,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 30,
          ),
        ),
        BlocBuilder<FavoriteBloc, FavoriteState>(
          builder: (context, state) {
            if (state is IsFavoriteMovie) {
              return GestureDetector(
                onTap: () => BlocProvider.of<FavoriteBloc>(context).add(
                  ToggleFavoriteMovieEvent(
                    state.isMovieFavorite,
                    MovieEntity.fromMovieDetailEntity(movieDetailEntity),
                  ),
                ),
                child: Icon(
                  state.isMovieFavorite
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: Colors.white,
                  size: 30,
                ),
              );
            } else {
              return const Icon(
                Icons.favorite_border,
                color: Colors.white,
                size: 30,
              );
            }
          },
        ),
      ],
    );
  }
}

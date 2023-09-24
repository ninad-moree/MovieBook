import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/constants/route_constants.dart';
import '../../../data/core/api_constants.dart';
import '../../../domain/entities/movie_entity.dart';
import '../../blocs/favorite/favorite_bloc.dart';
import '../movie_detail/movie_detail_arguments.dart';

class FavoriteMovieCardWidget extends StatelessWidget {
  final MovieEntity movie;
  const FavoriteMovieCardWidget({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(
            RouteList.movieDetail,
            arguments: MovieDetailArguments(movie.id),
          );
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Stack(
            children: [
              CachedNetworkImage(
                imageUrl: '${ApiConstants.BASE_IMG_URL}${movie.posterPath}',
                fit: BoxFit.cover,
                width: 300,
              ),
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () => BlocProvider.of<FavoriteBloc>(context).add(
                    DeleteFavoriteMovieEvent(movie.id),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8),
                    child: Icon(
                      Icons.delete,
                      size: 25,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

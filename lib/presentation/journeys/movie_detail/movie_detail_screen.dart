import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviebook/di/get_it.dart';
import 'package:moviebook/presentation/blocs/movie_detail/moviedetail_bloc.dart';
import 'package:moviebook/presentation/journeys/movie_detail/movie_detail_arguments.dart';

import 'big_poster.dart';

class MovieDetailScreen extends StatefulWidget {
  final MovieDetailArguments movieDetailArguments;

  const MovieDetailScreen({
    super.key,
    required this.movieDetailArguments,
  });

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  late MoviedetailBloc _moviedetailBloc;

  @override
  void initState() {
    super.initState();
    _moviedetailBloc = getItInstance<MoviedetailBloc>();
    _moviedetailBloc
        .add(MoviedetailLoadEvent(widget.movieDetailArguments.movieId));
  }

  @override
  void dispose() {
    _moviedetailBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<MoviedetailBloc>.value(
        value: _moviedetailBloc,
        child: BlocBuilder<MoviedetailBloc, MoviedetailState>(
          builder: (context, state) {
            if (state is MovieDetailLoaded) {
              final movieDetail = state.movieDetailEntity;
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  BigPoster(
                    movie: movieDetail,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      movieDetail.overview,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ],
              );
            } else if (state is MovieDetailError) {
              return Container();
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}

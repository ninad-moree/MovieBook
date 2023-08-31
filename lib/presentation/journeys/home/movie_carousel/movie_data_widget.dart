import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviebook/presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';

class MovieDataWidget extends StatelessWidget {
  const MovieDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBackdropBloc, MovieBackdropState>(
        builder: (context, state) {
      if (state is MovieBackDropChanged) {
        return Text(
          state.movie.title,
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.fade,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        );
      }
      return const SizedBox.shrink();
    });
  }
}

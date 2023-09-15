import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviebook/common/constants/translation_constants.dart';
import 'package:moviebook/common/extensions/string_extension.dart';
import 'package:moviebook/di/get_it.dart';
import 'package:moviebook/presentation/blocs/cast/cast_bloc.dart';
import 'package:moviebook/presentation/blocs/movie_detail/moviedetail_bloc.dart';
import 'package:moviebook/presentation/blocs/videos/videos_bloc.dart';
import 'package:moviebook/presentation/journeys/movie_detail/cast_widget.dart';
import 'package:moviebook/presentation/journeys/movie_detail/movie_detail_arguments.dart';

import 'big_poster.dart';
import 'videos_widget.dart';

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
  late CastBloc _castBloc;
  late VideosBloc _videosBloc;

  @override
  void initState() {
    super.initState();
    _moviedetailBloc = getItInstance<MoviedetailBloc>();
    _castBloc = _moviedetailBloc.castBloc;
    _videosBloc = _moviedetailBloc.videosBloc;

    _moviedetailBloc.add(
      MoviedetailLoadEvent(
        widget.movieDetailArguments.movieId,
      ),
    );
  }

  @override
  void dispose() {
    _moviedetailBloc.close();
    _castBloc.close();
    _videosBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider.value(value: _moviedetailBloc),
          BlocProvider.value(value: _castBloc),
          BlocProvider.value(value: _videosBloc),
        ],
        child: BlocBuilder<MoviedetailBloc, MoviedetailState>(
          builder: (context, state) {
            if (state is MovieDetailLoaded) {
              final movieDetail = state.movieDetailEntity;
              return SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    BigPoster(
                      movie: movieDetail,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      child: Text(
                        movieDetail.overview,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                      child: Text(
                        TranslationConstants.cast.t(context),
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ),
                    const CastWidget(),
                    VideosWidget(videosBloc: _videosBloc),
                  ],
                ),
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

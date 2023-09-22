import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/constants/translation_constants.dart';
import '../../../common/extensions/string_extension.dart';
import '../../../di/get_it.dart';
import '../../blocs/cast/cast_bloc.dart';
import '../../blocs/favorite/favorite_bloc.dart';
import '../../blocs/movie_detail/moviedetail_bloc.dart';
import '../../blocs/videos/videos_bloc.dart';
import 'big_poster.dart';
import 'cast_widget.dart';
import 'movie_detail_arguments.dart';

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
  late FavoriteBloc _favoriteBloc;

  @override
  void initState() {
    super.initState();
    _moviedetailBloc = getItInstance<MoviedetailBloc>();
    _castBloc = _moviedetailBloc.castBloc;
    _videosBloc = _moviedetailBloc.videosBloc;
    _favoriteBloc = _moviedetailBloc.favoriteBloc;

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
    _favoriteBloc.close();
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
          BlocProvider.value(value: _favoriteBloc),
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
                    // VideosWidget(videosBloc: _videosBloc),
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

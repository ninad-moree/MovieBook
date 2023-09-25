import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/constants/translation_constants.dart';
import '../../../../common/extensions/string_extension.dart';
import '../../../blocs/movie_tabbed/movie_tabbed_bloc.dart';
import '../../../widgets/app_error_widget.dart';
import '../../loading/loading_circle.dart';
import 'movie_list.dart';
import 'movie_tabbed_constant.dart';
import 'tab_title_widget.dart';

class MovieTabbedWidget extends StatefulWidget {
  const MovieTabbedWidget({super.key});

  @override
  State<MovieTabbedWidget> createState() => _MovieTabbedWidgetState();
}

class _MovieTabbedWidgetState extends State<MovieTabbedWidget>
    with SingleTickerProviderStateMixin {
  MovieTabbedBloc get movieTabbedbloc =>
      BlocProvider.of<MovieTabbedBloc>(context);

  int currentTabIndex = 0;

  @override
  void initState() {
    super.initState();
    movieTabbedbloc.add(MovieTabChangedEVent(currentTabIndex: currentTabIndex));
  }

  @override
  void dispose() {
    super.dispose();
    movieTabbedbloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieTabbedBloc, MovieTabbedState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for (var i = 0;
                      i < MovieTabbedConstants.movieTabs.length;
                      i++)
                    TabTitleWidget(
                      title: MovieTabbedConstants.movieTabs[i].title,
                      onTap: () => _onTabTpped(i),
                      isSelected: MovieTabbedConstants.movieTabs[i].index ==
                          state.currentTabIndex,
                    ),
                ],
              ),
              if (state is MovieTabChanged)
                state.movies.isEmpty
                    ? Expanded(
                        child: Center(
                          child: Text(
                            TranslationConstants.noMovies.t(context),
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                      )
                    : Expanded(
                        child: MovieList(movies: state.movies),
                      ),
              if (state is MovieTabLoadError)
                Expanded(
                  child: AppErrorWidget(
                    errorType: state.errorType,
                    onPressed: () => movieTabbedbloc.add(
                      MovieTabChangedEVent(
                        currentTabIndex: state.currentTabIndex,
                      ),
                    ),
                  ),
                ),
              if (state is MovieTabLoading)
                const Expanded(
                  child: Center(
                    child: LoadingCircle(
                      size: 100,
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  void _onTabTpped(int index) {
    movieTabbedbloc.add(MovieTabChangedEVent(currentTabIndex: index));
  }
}

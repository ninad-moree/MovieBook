import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/constants/translation_constants.dart';
import '../../../common/extensions/string_extension.dart';
import '../../blocs/search_movie/search_movie_bloc.dart';
import '../../themes/app_color.dart';
import '../../themes/text_theme.dart';
import '../../widgets/app_error_widget.dart';
import 'search_movie_card.dart';

class CustomSearchDelegate extends SearchDelegate {
  final SearchMovieBloc searchMovieBloc;

  CustomSearchDelegate(this.searchMovieBloc);

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColor.vulcan,
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: Theme.of(context).textTheme.greySubtitle1,
        border: InputBorder.none,
      ),
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: AppColor.violet,
      ),
    );
  }

  //right hand side widget in the i/p field
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: query.isEmpty ? null : () => query = '',
        icon: Icon(
          Icons.clear,
          color: query.isEmpty ? Colors.white : AppColor.royalBlue,
        ),
      ),
    ];
  }

  //left hand side widget in the i/p field
  @override
  Widget? buildLeading(BuildContext context) {
    return GestureDetector(
      onTap: () {
        close(context, null);
      },
      child: const Icon(
        Icons.arrow_back,
        color: Colors.white,
        size: 25,
      ),
    );
  }

  //ui after search is pressed
  @override
  Widget buildResults(BuildContext context) {
    searchMovieBloc.add(
      SearchTermChangedEvent(query),
    );

    return BlocBuilder<SearchMovieBloc, SearchMovieState>(
      bloc: searchMovieBloc,
      builder: (context, state) {
        if (state is SearchMovieError) {
          return AppErrorWidget(
            errorType: state.appErrorType,
            onPressed: () => searchMovieBloc.add(SearchTermChangedEvent(query)),
          );
        } else if (state is SearchMovieLoaded) {
          final movies = state.movies;
          if (movies.isEmpty) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  TranslationConstants.noMoviesSearched.t(context),
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }
          return ListView.builder(
            itemBuilder: (context, index) => SearchMovieCard(
              movie: movies[index],
            ),
            itemCount: movies.length,
            scrollDirection: Axis.vertical,
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }

  // when user is typing and autofill hints
  @override
  Widget buildSuggestions(BuildContext context) {
    return const SizedBox.shrink();
  }
}

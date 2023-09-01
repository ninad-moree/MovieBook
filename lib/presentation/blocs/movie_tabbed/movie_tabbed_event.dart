part of 'movie_tabbed_bloc.dart';

sealed class MovieTabbedEvent extends Equatable {
  const MovieTabbedEvent();

  @override
  List<Object> get props => [];
}

class MovieTabChangedEVent extends MovieTabbedEvent {
  final int currentTabIndex;

  const MovieTabChangedEVent({this.currentTabIndex = 0});

  @override
  List<Object> get props => [currentTabIndex];
}

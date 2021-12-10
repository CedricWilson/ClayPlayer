part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class FetchList extends HomeEvent {}

class PlayAudio extends HomeEvent {
  final Music music;
  final double height;

  PlayAudio({this.music,this.height});

  @override
  List<Object> get props => [music,height];
}

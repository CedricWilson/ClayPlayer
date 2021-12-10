part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class ListFetched extends HomeState {
  final List<SongInfo> songList;
   final List<Uint8List> albumList;

  ListFetched({this.songList,this.albumList});

  @override
  List<Object> get props => [songList,albumList];
}

class PlayingAudio extends HomeState {
  final double height;
  

  PlayingAudio({this.height});

  @override
  List<Object> get props => [height];

}

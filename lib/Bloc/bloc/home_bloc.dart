import 'dart:async';
import 'dart:typed_data';

import 'package:ClayPlayer/Model/music.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:sizer/sizer.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial());

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {

    if (event is FetchList) {
      List<SongInfo> list = [];
      List<Uint8List> albumList = [];

      List<SongInfo> song = await FlutterAudioQuery()
          .getSongs(sortType: SongSortType.RECENT_YEAR);

      for (final i in song) {
        if (int.parse(i.fileSize ?? "0") > 1022248) {
          list.add(i);
        }
      }

      for (final i in list) {
        try {
          Uint8List k = await FlutterAudioQuery()
              .getArtwork(type: ResourceType.ALBUM, id: i.albumId);

          albumList.add(k);
        } catch (e) {
          albumList.add(null);
        }
      }

      yield ListFetched(songList: list, albumList: albumList);
    }

    if (event is PlayAudio) {


      yield PlayingAudio(height: event.height);
    }
  }

  double height =0;

  setHeight(double h) {
    height = h;
  }
}

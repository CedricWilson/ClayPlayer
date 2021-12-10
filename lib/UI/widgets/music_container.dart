import 'dart:typed_data';
import 'package:ClayPlayer/Bloc/bloc/home_bloc.dart';
import 'package:ClayPlayer/UI/widgets/album.dart';
import 'package:ClayPlayer/UI/widgets/text_widget.dart';
import 'package:audioplayers/audioplayers.dart';

import 'package:flutter/material.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:sizer/sizer.dart';

class MusicContainer extends StatefulWidget {
  final List<Uint8List> albumList;
  final List<SongInfo> list;
  final int index;
  final AudioPlayer audio;

  const MusicContainer(
      {Key key, this.albumList, this.list, this.index, this.audio})
      : super(key: key);

  @override
  _MusicContainerState createState() => _MusicContainerState();
}

class _MusicContainerState extends State<MusicContainer> {
  HomeBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<HomeBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await widget.audio
            .play(widget.list[widget.index].filePath, isLocal: true);
        
        // bloc.add(PlayAudio(height: 100.h));
      },
      child: Container(
        child: Column(
          // mainAxisSize: MainAxisSize.max,
          children: [
            Flexible(
                child:
                    AlbumPic(albumList: widget.albumList, index: widget.index)),
            SizedBox(
              height: 1.h,
            ),
            CText(
              list: widget.list,
              index: widget.index,
            )
          ],
        ),
      ),
    );
  }
}

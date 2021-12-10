import 'dart:typed_data';
import 'package:ClayPlayer/Bloc/bloc/home_bloc.dart';
import 'package:ClayPlayer/UI/widgets/album.dart';
import 'package:ClayPlayer/UI/widgets/text_widget.dart';
import 'package:ClayPlayer/Utils/colors.dart';
import 'package:audioplayers/audioplayers.dart';

import 'package:flutter/material.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:sizer/sizer.dart';

class PlayerViewer extends StatefulWidget {
  PlayerViewer({Key key}) : super(key: key);

  @override
  _PlayerViewerState createState() => _PlayerViewerState();
}

class _PlayerViewerState extends State<PlayerViewer> {
  HomeBloc bloc;
  double height;

  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<HomeBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        bloc.add(PlayAudio(height: 0));
        return null;
      },
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state is PlayingAudio) {
            height = state.height;
          }
        },
        builder: (context, state) {
          return Container(
            height: height,
            width: 100.w,
            color: C.red,
          );
        },
      ),
    );
  }
}

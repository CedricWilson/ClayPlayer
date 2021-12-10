import 'dart:typed_data';

import 'package:ClayPlayer/Bloc/bloc/home_bloc.dart';
import 'package:ClayPlayer/UI/player_view.dart';
import 'package:ClayPlayer/UI/widgets/music_container.dart';
import 'package:ClayPlayer/Utils/colors.dart';
import 'package:audioplayers/audioplayers.dart';

import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import 'package:sizer/sizer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeBloc bloc;

  List<SongInfo> list = [];
  List<Uint8List> albumList = [];

  AudioPlayer player;



  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<HomeBloc>(context);
    bloc.add(FetchList());
    player = AudioPlayer();
  }

  @override
  Widget build(BuildContext context) {
    return ClayContainer(
      color: C.greyTop,
      child: Scaffold(
        appBar: AppBar(
          brightness: Brightness.light,
          toolbarHeight: 0,
          backgroundColor: C.greyTop,
          shadowColor: Colors.transparent,
        ),
        body: mainBody(context),
        backgroundColor: Colors.transparent,
      ),
    );
  }

  listBody(BuildContext context) {
    return ClayContainer(
      customBorderRadius: BorderRadius.only(
          topRight: Radius.circular(40), topLeft: Radius.circular(40)),
      color: C.greyTop,
      emboss: true,
      // depth: ,
      child: GridView.builder(
          shrinkWrap: true,
          itemCount: list.length,
          padding: EdgeInsets.only(left: 5.w, right: 5.w, top: 5.h),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 10,
            mainAxisSpacing: 15,
            childAspectRatio: (1 / 1.5),
          ),
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return MusicContainer(
              albumList: albumList,
              list: list,
              index: index,
              audio: player,
            );
          }),
    );
  }

  mainBody(BuildContext context) {
    return Stack(
      children: [
       
        SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [button(), blocBody(context)],
          ),
        ),
         PlayerViewer(),
      ],
    );
  }

  blocBody(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minHeight: 80.h,
      ),
      child: BlocConsumer<HomeBloc, HomeState>(listener: (context, state) {
        if (state is ListFetched) {
          list = state.songList;
          albumList = state.albumList;
        }
      }, builder: (context, state) {
        return listBody(context);
      }),
    );
  }

  button() {
    return Padding(
      padding: EdgeInsets.only(top: 10.h, bottom: 5.h),
      child: RaisedButton(onPressed: () {
        
        player.stop();
  
      }),
    );
  }
}

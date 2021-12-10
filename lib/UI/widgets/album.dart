import 'dart:typed_data';

import 'package:ClayPlayer/Utils/colors.dart';
import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:sizer/sizer.dart';

class AlbumPic extends StatelessWidget {
  final List<Uint8List> albumList;

  final int index;

  const AlbumPic({Key key, this.index, this.albumList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (albumList[index] != null && albumList[index].isNotEmpty) {
      return albumContainer();
    } else {
      return placeholderContainer();
    }
  }

  albumContainer() {
    return ClayContainer(
      color: C.borderGrey,
      borderRadius: 150,
      child: Padding(
        padding: EdgeInsets.all(1.0.w),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(150.0),
          child: Image.memory(albumList[index]),
        ),
      ),
    );
  }

  placeholderContainer() {
    return LayoutBuilder(builder: (context, constraint) {
      return ClayContainer(
        color: C.borderGrey,
        height: constraint.biggest.width,
        width: constraint.biggest.width,
        borderRadius: 150,
        child: Padding(
          padding: EdgeInsets.all(1.0.w),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(150.0),
            child: Container(
                child: Icon(
              Icons.music_note,
              color: C.TextGrey,
            )),
          ),
        ),
      );
    });
  }
}

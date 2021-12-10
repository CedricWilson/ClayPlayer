
import 'package:ClayPlayer/Utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:sizer/sizer.dart';

class CText extends StatelessWidget {
final List<SongInfo> list;

  final int index;

   const CText({Key key, this.list, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        
        child: Text(
      (list[index].artist + " - " + list[index].title),
      textAlign: TextAlign.center,
      maxLines: 2,
      style: TextStyle(
          fontSize: 10.sp, color: C.TextGrey, fontWeight: FontWeight.w400),
    ));
  }
}

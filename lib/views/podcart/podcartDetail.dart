import 'dart:ui';

import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:exercise_1/constants/colors/color.dart';
import 'package:exercise_1/constants/vector.dart';
import 'package:exercise_1/views/podcart/components/item_Pobcart_In_Detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants/image.dart';
import '../../models/podcastModel.dart';
import '../dashboard/components/item_podcart.dart';
import 'components/avatar_widget.dart';

class podcartDetail extends StatefulWidget {
  podcartDetail({
    super.key,
    required this.podList,
    required this.pob,
  });
  PobcastModel pob = PobcastModel(title: '', image: '', duration: '', date: '');
  List<PobcastModel> podList = [];

  @override
  State<podcartDetail> createState() => _podcartDetailState();
}

class _podcartDetailState extends State<podcartDetail> {
  final PageController controller = PageController();
  Duration progress = Duration();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Stack(children: [
      Container(
        color: AppColors.background,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.only(left: 24, right: 24, top: 12),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: SvgPicture.asset(AppVectors.arrowLeft,
                      color: AppColors.white),
                ),
                Spacer(),
                Material(
                    color: Colors.transparent,
                    child: InkWell(
                        customBorder: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        hoverColor: AppColors.white,
                        highlightColor: Colors.white.withOpacity(0.5),
                        splashColor: Colors.white.withOpacity(0.5),
                        onTap: () {},
                        child: Ink(
                            child: SvgPicture.asset(AppVectors.setting,
                                color: AppColors.white)))),
                SizedBox(width: 16),
                SvgPicture.asset(AppVectors.more, color: AppColors.white)
              ],
            ),
          ),
          Container(
            height: 309,
            child: PageView(
              scrollDirection: Axis.horizontal,
              children: [
                AvatarWidget(
                  image: widget.pob.image,
                  title: widget.pob.title,
                ),
                Container(
                  padding: EdgeInsets.only(left: 24, right: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.pob.title,
                          style: TextStyle(
                              fontFamily: 'SF Pro Display',
                              fontSize: 18,
                              color: AppColors.white,
                              fontWeight: FontWeight.w600)),
                      Text(widget.pob.date,
                          style: TextStyle(
                              fontFamily: 'SF Pro Display',
                              fontSize: 18,
                              color: AppColors.white,
                              fontWeight: FontWeight.w600)),
                      Text(widget.pob.duration,
                          style: TextStyle(
                              fontFamily: 'SF Pro Display',
                              fontSize: 18,
                              color: AppColors.white,
                              fontWeight: FontWeight.w600))
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 36),
            padding: EdgeInsets.only(left: 16, right: 16),
            child: ProgressBar(
              progressBarColor: AppColors.redIcon,
              baseBarColor: AppColors.grey200,
              thumbColor: AppColors.white,
              thumbGlowRadius: 18,
              timeLabelTextStyle: TextStyle(
                  fontFamily: 'SF Pro Display',
                  fontSize: 8,
                  color: AppColors.white,
                  fontWeight: FontWeight.w600),
              progress: progress,
              buffered: Duration(milliseconds: 2000),
              total: Duration(minutes: 3),
              onSeek: (duration) {
                print('User selected a new time: $duration');
                setState(() {
                  progress = duration;
                });
              },
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 16, right: 16),
            margin: EdgeInsets.only(top: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Material(
                    color: Colors.transparent,
                    child: InkWell(
                        customBorder: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        hoverColor: AppColors.white,
                        highlightColor: Colors.white.withOpacity(0.5),
                        splashColor: Colors.white.withOpacity(0.5),
                        onTap: () {},
                        child: Ink(
                            child: SvgPicture.asset(AppVectors.shuffle,
                                color: AppColors.white)))),
                Material(
                    color: Colors.transparent,
                    child: InkWell(
                        customBorder: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        hoverColor: AppColors.white,
                        highlightColor: Colors.white.withOpacity(0.5),
                        splashColor: Colors.white.withOpacity(0.5),
                        onTap: () {},
                        child: Ink(
                            child: SvgPicture.asset(AppVectors.skip,
                                color: AppColors.white)))),
                Material(
                    color: Colors.transparent,
                    child: InkWell(
                        customBorder: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        hoverColor: AppColors.white,
                        highlightColor: Colors.white.withOpacity(0.5),
                        splashColor: Colors.white.withOpacity(0.5),
                        onTap: () {},
                        child: Ink(
                            child: SvgPicture.asset(AppVectors.playCircle,
                                color: AppColors.white)))),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    customBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    hoverColor: AppColors.white,
                    highlightColor: Colors.white.withOpacity(0.5),
                    splashColor: Colors.white.withOpacity(0.5),
                    onTap: () {},
                    child: Ink(
                      child: SvgPicture.asset(AppVectors.skipForward,
                          color: AppColors.white),
                    ),
                  ),
                ),
                Material(
                    color: Colors.transparent,
                    child: InkWell(
                        customBorder: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        hoverColor: AppColors.white,
                        highlightColor: Colors.white.withOpacity(0.5),
                        splashColor: Colors.white.withOpacity(0.5),
                        onTap: () {},
                        child: Ink(
                            child: SvgPicture.asset(AppVectors.sync,
                                color: AppColors.white)))),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 16, right: 16),
            margin: EdgeInsets.only(top: 16),
            child: Row(
              children: [
                Text('Best Podcast Episodes',
                    maxLines: 1,
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                        fontFamily: 'SF Pro Display',
                        fontSize: 14,
                        color: AppColors.white,
                        fontWeight: FontWeight.w600)),
                Spacer(),
                Text('View all',
                    style: TextStyle(
                        fontFamily: 'SF Pro Display',
                        fontSize: 10,
                        color: AppColors.white,
                        fontWeight: FontWeight.w600)),
              ],
            ),
          ),
          SizedBox(height: 16),
          Container(
            height: 229 - 16,
            margin: EdgeInsets.only(bottom: 24),
            padding: EdgeInsets.only(
              left: 8,
              right: 8,
            ),
            child: ListView.builder(
                itemCount: widget.podList.length,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(bottom: 8),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        customBorder: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        hoverColor: AppColors.white,
                        highlightColor: Colors.white.withOpacity(0.5),
                        splashColor: Colors.white.withOpacity(0.5),
                        onTap: () {
                          setState(() {
                            widget.pob = widget.podList[index];
                          });
                        },
                        child: Ink(
                          padding: EdgeInsets.all(8),
                          child:
                              ItemPodcartInDetail(pob: widget.podList[index]),
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ],
      )
    ])));
  }
}

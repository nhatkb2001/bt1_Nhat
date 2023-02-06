import 'dart:ui';

import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:exercise_1/constants/colors/color.dart';
import 'package:exercise_1/constants/vector.dart';
import 'package:exercise_1/views/podcart/itemPobcartInDetail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants/image.dart';
import '../../models/podcastModel.dart';
import '../dashboard/components/itemPodcart.dart';
import 'avatarWidget.dart';

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
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Stack(children: [
      Container(
        color: AppColors.background,
      ),
      Container(
          padding: EdgeInsets.only(left: 16, right: 16, top: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.only(left: 8, right: 8),
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
                    SvgPicture.asset(AppVectors.setting,
                        color: AppColors.white),
                    SizedBox(width: 8),
                    SvgPicture.asset(AppVectors.more, color: AppColors.white)
                  ],
                ),
              ),
              Container(
                height: 309,
                child: PageView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    avatarWidget(
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
                child: ProgressBar(
                  progressBarColor: AppColors.redIcon,
                  baseBarColor: AppColors.grey200,
                  thumbColor: AppColors.white,
                  timeLabelTextStyle: TextStyle(
                      fontFamily: 'SF Pro Display',
                      fontSize: 8,
                      color: AppColors.white,
                      fontWeight: FontWeight.w600),
                  progress: Duration(milliseconds: 1000),
                  buffered: Duration(milliseconds: 2000),
                  total: Duration(milliseconds: 5000),
                  onSeek: (duration) {
                    print('User selected a new time: $duration');
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(AppVectors.shuffle,
                        color: AppColors.white),
                    SvgPicture.asset(AppVectors.skip, color: AppColors.white),
                    SvgPicture.asset(AppVectors.playCircle,
                        color: AppColors.white),
                    SvgPicture.asset(AppVectors.skipForward,
                        color: AppColors.white),
                    SvgPicture.asset(AppVectors.sync, color: AppColors.white),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.comment,
                      size: 24,
                      color: AppColors.white,
                    ),
                    Icon(
                      Icons.download,
                      size: 24,
                      color: AppColors.white,
                    ),
                    Icon(
                      Icons.playlist_add,
                      size: 24,
                      color: AppColors.white,
                    ),
                    Icon(
                      Icons.info_outline,
                      size: 24,
                      color: AppColors.white,
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 16),
                child: Row(
                  children: [
                    Text('Best Podcast Episodes',
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
              Container(
                height: 189,
                margin: EdgeInsets.only(bottom: 24),
                child: ListView.builder(
                    itemCount: widget.podList.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            widget.pob = widget.podList[index];
                          });
                        },
                        child: itemPodcartInDetail(pob: widget.podList[index]),
                      );
                    }),
              ),
            ],
          ))
    ])));
  }
}

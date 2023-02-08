import 'package:exercise_1/constants/colors/color.dart';
import 'package:exercise_1/constants/image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../constants/vector.dart';
import '../../../../models/podcastModel.dart';

class ItemPodcartInDetail extends StatelessWidget {
  ItemPodcartInDetail({
    super.key,
    required this.pob,
  });
  PobcastModel pob = PobcastModel(title: '', image: '', duration: '', date: '');

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 48,
            width: 48,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8))),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              child: Image.asset(
                pob.image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 8),
          Container(
            height: 48,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Container(
                      width: 100,
                      padding: EdgeInsets.only(right: 8),
                      child: Text(pob.date,
                          overflow: TextOverflow.clip,
                          maxLines: 1,
                          style: TextStyle(
                              fontFamily: 'SF Pro Display',
                              fontSize: 8,
                              color: (AppColors.white).withOpacity(0.7),
                              fontWeight: FontWeight.w400)),
                    ),
                    Container(
                      width: 100,
                      padding: EdgeInsets.only(right: 8),
                      child: Text(pob.duration,
                          overflow: TextOverflow.clip,
                          maxLines: 1,
                          style: TextStyle(
                              fontFamily: 'SF Pro Display',
                              fontSize: 8,
                              color: (AppColors.white).withOpacity(0.7),
                              fontWeight: FontWeight.w400)),
                    ),
                  ],
                ),
                SizedBox(height: 4),
                Container(
                  width: 250,
                  padding: EdgeInsets.only(right: 8),
                  child: Text(pob.title,
                      overflow: TextOverflow.clip,
                      maxLines: 2,
                      style: const TextStyle(
                          fontFamily: 'SF Pro Display',
                          fontSize: 14,
                          color: AppColors.white,
                          fontWeight: FontWeight.w600)),
                ),
              ],
            ),
          ),
          Spacer(),
          Container(
            margin: EdgeInsets.only(right: 8),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                focusColor: AppColors.white,
                hoverColor: AppColors.white,
                splashColor: Colors.grey.withOpacity(0.2),
                highlightColor: Colors.grey.withOpacity(0.2),
                onTap: () {
                  print('more');
                },
                child: Ink(
                  child: Container(
                    height: 16,
                    child: SvgPicture.asset(
                      AppVectors.more,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

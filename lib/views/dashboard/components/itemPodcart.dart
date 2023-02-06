import 'package:exercise_1/constants/colors/color.dart';
import 'package:exercise_1/constants/image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants/vector.dart';
import '../../../models/podcastModel.dart';
import '../../podcart/podcartDetail.dart';

class itemPodcart extends StatelessWidget {
  itemPodcart({super.key, required this.pob, required this.podList});
  PobcastModel pob = PobcastModel(title: '', image: '', duration: '', date: '');
  List<PobcastModel> podList = [];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: ((context) => podcartDetail(
                      pob: pob,
                      podList: podList,
                    ))));
      },
      child: Container(
        margin: EdgeInsets.only(top: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: 8),
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
            SizedBox(width: 16),
            Container(
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
                                fontSize: 14,
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
                                fontSize: 14,
                                color: (AppColors.white).withOpacity(0.7),
                                fontWeight: FontWeight.w400)),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Container(
                    width: 250,
                    padding: EdgeInsets.only(right: 8),
                    child: Text(pob.title,
                        overflow: TextOverflow.clip,
                        maxLines: 1,
                        style: const TextStyle(
                            fontFamily: 'SF Pro Display',
                            fontSize: 16,
                            color: AppColors.white,
                            fontWeight: FontWeight.w600)),
                  ),
                ],
              ),
            ),
            Spacer(),
            SvgPicture.asset(
              AppVectors.more,
              color: AppColors.white,
            ),
          ],
        ),
      ),
    );
  }
}

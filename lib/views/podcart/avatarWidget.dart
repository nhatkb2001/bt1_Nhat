import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants/colors/color.dart';
import '../../constants/vector.dart';

class avatarWidget extends StatelessWidget {
  avatarWidget({super.key, required this.image, required this.title});

  String image;
  String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              child: Container(
                height: 208,
                width: 200,
                margin: EdgeInsets.only(top: 24 + 40),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: ExactAssetImage(image),
                    fit: BoxFit.contain,
                  ),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                  child: Container(
                    decoration:
                        BoxDecoration(color: Colors.white.withOpacity(0.0)),
                  ),
                ),
              ),
            ),
            Container(
              width: 248,
              height: 232,
              margin: EdgeInsets.only(top: 24),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                child: Image.asset(
                  image,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Container(
              alignment: Alignment.topRight,
              margin: EdgeInsets.only(bottom: 180 - 8, right: 24 + 24 + 24),
              child: SvgPicture.asset(AppVectors.heart, color: AppColors.white),
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.only(top: 16),
          child: Text(title,
              style: TextStyle(
                  fontFamily: 'SF Pro Display',
                  fontSize: 18,
                  color: AppColors.white,
                  fontWeight: FontWeight.w600)),
        ),
      ],
    );
  }
}

import 'package:exercise_1/constants/colors/color.dart';
import 'package:exercise_1/constants/image.dart';
import 'package:flutter/material.dart';

class ItemTrending extends StatelessWidget {
  ItemTrending(
      {super.key,
      required this.gradient,
      required this.stops,
      required this.tranform,
      required this.title,
      required this.index,
      required this.image,
      required this.description});
  List<Color> gradient;
  List<double> stops;
  double tranform;
  String title;
  String description;
  String image;
  int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: index == 3 ? EdgeInsets.only(right: 84) : EdgeInsets.all(0),
      child: Stack(
        children: [
          Container(
            height: 52 * 2,
            width: 88 * 3,
            margin: const EdgeInsets.only(right: 8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    gradient[0],
                    gradient[1],
                  ],
                  stops: [stops[0], stops[1]],
                  transform: GradientRotation(tranform * 3.14 / 180),
                )),
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
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(width: 8),
                    Container(
                      height: 72,
                      width: 72,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        child: image != ''
                            ? Image.asset(
                                image,
                                fit: BoxFit.cover,
                              )
                            : FittedBox(
                                child: CircularProgressIndicator(
                                color: Colors.white,
                              )),
                      ),
                    ),
                    SizedBox(width: 16),
                    Container(
                      margin: EdgeInsets.only(top: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 170,
                            padding: EdgeInsets.only(right: 8),
                            child: Text(title,
                                style: const TextStyle(
                                    fontFamily: 'SF Pro Display',
                                    fontSize: 16,
                                    color: AppColors.grey700,
                                    fontWeight: FontWeight.w700)),
                          ),
                          SizedBox(height: 8),
                          Container(
                            width: 170,
                            padding: EdgeInsets.only(right: 8),
                            child: Text(description,
                                overflow: TextOverflow.clip,
                                maxLines: 2,
                                style: const TextStyle(
                                    fontFamily: 'SF Pro Display',
                                    fontSize: 8,
                                    color: AppColors.grey700,
                                    fontWeight: FontWeight.w400)),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

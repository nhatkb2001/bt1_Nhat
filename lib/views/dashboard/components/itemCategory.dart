import 'package:exercise_1/constants/colors/color.dart';
import 'package:flutter/material.dart';

class itemCategory extends StatelessWidget {
  itemCategory(
      {super.key,
      required this.gradient,
      required this.stops,
      required this.tranform,
      required this.category});
  List<Color> gradient;
  List<double> stops;
  double tranform;
  String category;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      width: 88,
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
      child: Center(
        child: Text(category,
            style: const TextStyle(
                fontFamily: 'SF Pro Display',
                fontSize: 14,
                color: AppColors.white,
                fontWeight: FontWeight.w700)),
      ),
    );
  }
}

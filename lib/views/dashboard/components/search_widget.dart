import 'package:exercise_1/constants/colors/color.dart';
import 'package:exercise_1/constants/vector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({
    super.key,
  });

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
        child: Container(
      margin: const EdgeInsets.only(top: 8),
      padding: EdgeInsets.only(left: 16, right: 13),
      height: 40,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: AppColors.backgroundSearch),
      child: TextFormField(
        style: const TextStyle(
            fontFamily: 'SF Pro Display',
            fontSize: 14,
            color: AppColors.white,
            fontWeight: FontWeight.w400),
        controller: searchController,
        keyboardType: TextInputType.text,
        onChanged: (value) {},
        decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Container(
              padding: EdgeInsets.only(top: 11, bottom: 11),
              child: SvgPicture.asset(
                AppVectors.searchIcon,
                color: AppColors.white,
                fit: BoxFit.contain,
              ),
            ),
            hintText: 'Search',
            hintStyle: const TextStyle(
                fontFamily: 'SF Pro Display',
                fontSize: 14,
                color: AppColors.hintTextColor,
                fontWeight: FontWeight.w400)),
      ),
    ));
  }
}

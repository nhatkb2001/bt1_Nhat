import 'package:exercise_1/views/navigation/curved_navigation_Item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants/colors/color.dart';
import '../../constants/vector.dart';
import 'curved_navigation_bar.dart';

class navigationBar extends StatefulWidget {
  navigationBar({
    super.key,
  });

  @override
  State<navigationBar> createState() => _navigationBarState();
}

class _navigationBarState extends State<navigationBar> {
  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      backgroundColor: AppColors.background,
      color: AppColors.backgroundNavigation,
      buttonBackgroundColor: AppColors.redIcon,
      items: [
        CurvedNavigationBarItem(
          child: SvgPicture.asset(
            AppVectors.home,
            color: AppColors.white.withOpacity(0.5),
          ),
          label: 'Home',
        ),
        CurvedNavigationBarItem(
          child: SvgPicture.asset(
            AppVectors.fire,
            color: AppColors.white.withOpacity(0.5),
          ),
          label: 'Trend',
        ),
        CurvedNavigationBarItem(
          child: SvgPicture.asset(
            AppVectors.compass,
            color: AppColors.white.withOpacity(0.5),
          ),
          label: 'Explore',
        ),
        CurvedNavigationBarItem(
          child: SvgPicture.asset(
            AppVectors.chat,
            color: AppColors.white.withOpacity(0.5),
          ),
          label: 'Chat',
        ),
        CurvedNavigationBarItem(
          child: SvgPicture.asset(
            AppVectors.profile,
            color: AppColors.white.withOpacity(0.5),
          ),
          label: 'Profile',
        ),
      ],
      onTap: (index) {},
    );
  }
}

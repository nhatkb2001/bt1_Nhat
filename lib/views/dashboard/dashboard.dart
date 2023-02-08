import 'package:exercise_1/constants/colors/color.dart';
import 'package:exercise_1/constants/vector.dart';
import 'package:exercise_1/views/navigation/navigation_bar.dart';
import 'package:exercise_1/views/podcart/podcartDetail.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../constants/image.dart';
import '../../models/podcastModel.dart';
import '../navigation/curved_navigation_Item.dart';
import '../navigation/curved_navigation_bar.dart';
import 'components/item_category.dart';
import 'components/item_podcart.dart';
import 'components/item_trending.dart';
import 'components/search_widget.dart';

class Dashboard extends StatefulWidget {
  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<Color> orangeGradient = [
    Color(0xFFF12711),
    Color(0xFFF5AF19),
  ];
  List<Color> yellowGradient = [
    Color(0xFF9795EF),
    Color(0xFFF9C5D1),
  ];
  List<Color> adviceGradient = [
    Color(0xFFFB7BA2),
    Color(0xFFFCE043),
  ];
  List<double> stops1 = [-0.462, 1];
  double tranform1 = 326.38;
  //
  List<Color> blueGradient = [
    Color(0xFF623DEF),
    Color(0xFF340FD1),
  ];
  List<double> stops2 = [0, 1];
  double tranform2 = 144.4;
  //
  List<Color> greenGradient = [
    Color(0xFF43EF1D),
    Color(0xFF0D80F2),
  ];
  List<double> stops3 = [0, 1];
  double tranform3 = 144.4;
  //
  List<Color> redGradient = [
    Color(0xFFE9228D),
    Color(0xFFF12711),
  ];
  List<double> stops4 = [0, 1];
  double tranform4 = 144.4;
  List<PobcastModel> pobList = [];
  PobcastModel it1 = PobcastModel(
      image: AppImages.pod1,
      title: 'The Year in MoGraph - 2020',
      duration: '3 hr 31 min',
      date: 'DEC 30, 2020');
  PobcastModel it2 = PobcastModel(
      image: AppImages.pod3,
      title: 'Episode 197: The World of Lettering',
      duration: '42 min',
      date: 'DEC 2, 2020');
  PobcastModel it3 = PobcastModel(
      image: AppImages.pod4,
      title: 'How to Create YouTube Video Ads That Convert',
      duration: '52 min',
      date: 'DEC 18, 2020');
  PobcastModel it4 = PobcastModel(
      image: AppImages.pod5,
      title: 'Sounds Worth Saving',
      duration: '3 hr 31 min',
      date: 'DEC 30, 2020');
  @override
  void initState() {
    pobList.clear();
    pobList.add(it1);
    pobList.add(it2);
    pobList.add(it3);
    pobList.add(it4);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(children: [
        Container(
          color: AppColors.background,
        ),
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(left: 16, right: 16, top: 12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 21,
                      width: 21,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        child: Image.asset(
                          AppImages.avatar,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    const Text(
                      'Welcome Anh Nhat',
                      style: TextStyle(
                          fontFamily: 'SF Pro Display',
                          fontSize: 24,
                          color: AppColors.white,
                          fontWeight: FontWeight.w700),
                    ),
                    const Spacer(),
                    Container(
                      height: 22,
                      width: 21,
                      child: Stack(
                        children: [
                          SvgPicture.asset(
                            AppVectors.bellIcon,
                            color: AppColors.white,
                          ),
                          Container(
                            height: 8,
                            width: 8,
                            margin: EdgeInsets.only(top: 14, right: 13),
                            decoration: BoxDecoration(
                                color: AppColors.redIcon,
                                shape: BoxShape.circle),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 16, right: 16, top: 12),
                margin: const EdgeInsets.only(top: 24),
                child: const Text('Looking for podcast channels',
                    style: TextStyle(
                        fontFamily: 'SF Pro Display',
                        fontSize: 14,
                        color: AppColors.white,
                        fontWeight: FontWeight.w600)),
              ),
              const SearchWidget(),
              Container(
                padding: EdgeInsets.only(left: 16, right: 16, top: 12),
                margin: const EdgeInsets.only(top: 16),
                child: const Text('Trending Podcart',
                    style: TextStyle(
                        fontFamily: 'SF Pro Display',
                        fontSize: 14,
                        color: AppColors.white,
                        fontWeight: FontWeight.w600)),
              ),
              Container(
                padding: EdgeInsets.only(left: 16, right: 16, top: 12),
                margin: EdgeInsets.only(top: 16),
                height: 52 * 2,
                child: ListView.builder(
                    itemCount: 4,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return (index == 0)
                          ? ItemTrending(
                              gradient: yellowGradient,
                              stops: stops1,
                              tranform: tranform1,
                              title: 'Education about life',
                              description:
                                  'This is a podcart about education in your life',
                              image: AppImages.education,
                              index: index)
                          : (index == 1)
                              ? (ItemTrending(
                                  gradient: adviceGradient,
                                  stops: stops2,
                                  tranform: tranform2,
                                  title: 'Society is worser',
                                  description:
                                      'This is a podcart about education in your life',
                                  index: index,
                                  image: AppImages.society))
                              : (index == 2)
                                  ? (ItemTrending(
                                      gradient: yellowGradient,
                                      stops: stops3,
                                      tranform: tranform3,
                                      index: index,
                                      title: 'Sports',
                                      description:
                                          'This is a podcart about education in your life',
                                      image: AppImages.sport))
                                  : ItemTrending(
                                      gradient: adviceGradient,
                                      stops: stops4,
                                      tranform: tranform4,
                                      title: 'Films',
                                      index: index,
                                      description:
                                          'This is a podcart about education in your life',
                                      image: AppImages.film);
                    }),
              ),
              Container(
                padding: EdgeInsets.only(left: 16, right: 16, top: 12),
                margin: const EdgeInsets.only(top: 16),
                child: Row(
                  children: [
                    const Text('Categories',
                        style: TextStyle(
                            fontFamily: 'SF Pro Display',
                            fontSize: 14,
                            color: AppColors.white,
                            fontWeight: FontWeight.w600)),
                    const SizedBox(width: 7),
                    SvgPicture.asset(
                      AppVectors.arrow,
                      color: AppColors.white,
                    ),
                    const Spacer(),
                    const Text('View all',
                        style: TextStyle(
                            fontFamily: 'SF Pro Display',
                            fontSize: 14,
                            color: AppColors.white,
                            fontWeight: FontWeight.w400)),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 16),
                padding: EdgeInsets.only(left: 16, right: 16, top: 12),
                height: 52,
                child: ListView.builder(
                    itemCount: 4,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return (index == 0)
                          ? ItemCategory(
                              gradient: orangeGradient,
                              stops: stops1,
                              tranform: tranform1,
                              category: 'Education',
                            )
                          : (index == 1)
                              ? (ItemCategory(
                                  gradient: blueGradient,
                                  stops: stops2,
                                  tranform: tranform2,
                                  category: 'Society',
                                ))
                              : (index == 2)
                                  ? (ItemCategory(
                                      gradient: greenGradient,
                                      stops: stops3,
                                      tranform: tranform3,
                                      category: 'Sports',
                                    ))
                                  : ItemCategory(
                                      gradient: redGradient,
                                      stops: stops4,
                                      tranform: tranform4,
                                      category: 'Films',
                                    );
                    }),
              ),
              Container(
                margin: const EdgeInsets.only(top: 16),
                padding: EdgeInsets.only(left: 16, right: 16, top: 12),
                child: Row(
                  children: const [
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
                            fontSize: 14,
                            color: AppColors.white,
                            fontWeight: FontWeight.w400)),
                  ],
                ),
              ),
              bestPodcastWidget(
                pobList: pobList,
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.bottomCenter,
          child: navigationBar(),
        ),
      ]),
    ));
  }
}

class bestPodcastWidget extends StatelessWidget {
  bestPodcastWidget({super.key, required this.pobList});
  List<PobcastModel> pobList;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.only(top: 16, left: 8, right: 8),
      child: SingleChildScrollView(
        child: ListView.builder(
          itemCount: pobList.length,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return ItemPodcart(
              pob: pobList[index],
              podList: pobList,
            );
            ;
          },
        ),
      ),
    );
  }
}

import 'dart:io';

import 'package:exercise_1/constants/colors/color.dart';
import 'package:exercise_1/views/navigation/curved_navigation_Item.dart';
import 'package:exercise_1/views/navigation/nav_custom_painter.dart';
import 'package:flutter/material.dart';

import 'navigation_bar_item.dart';

typedef _LetIndexPage = bool Function(int value);

class CurvedNavigationBar extends StatefulWidget {
  /// Defines the appearance of the [CurvedNavigationBarItem] list that are
  /// arrayed within the bottom navigation bar.
  final List<CurvedNavigationBarItem> items;

  /// The index into [items] for the current active [CurvedNavigationBarItem].
  final int index;

  /// The color of the [CurvedNavigationBar] itself, default Colors.white.
  final Color color;

  /// The background color of floating button, default same as [color] attribute.
  final Color? buttonBackgroundColor;

  /// The color of [CurvedNavigationBar]'s background, default Colors.blueAccent.
  final Color backgroundColor;

  /// Called when one of the [items] is tapped.
  final ValueChanged<int>? onTap;

  /// Function which takes page index as argument and returns bool. If function
  /// returns false then page is not changed on button tap. It returns true by
  /// default.
  final _LetIndexPage letIndexChange;

  /// Curves interpolating button change animation, default Curves.easeOut.
  final Curve animationCurve;

  /// Duration of button change animation, default Duration(milliseconds: 600).
  final Duration animationDuration;

  /// Height of [CurvedNavigationBar].
  final double height;

  /// Padding of icon in floating button.
  final double iconPadding;

  /// Check if [CurvedNavigationBar] has label.
  final bool hasLabel;

  CurvedNavigationBar({
    Key? key,
    required this.items,
    this.index = 0,
    this.color = Colors.white,
    this.buttonBackgroundColor,
    this.backgroundColor = Colors.blueAccent,
    this.onTap,
    _LetIndexPage? letIndexChange,
    this.animationCurve = Curves.easeOut,
    this.animationDuration = const Duration(milliseconds: 300),
    this.iconPadding = 10.0,
    double? height,
  })  : assert(items.isNotEmpty),
        assert(0 <= index && index < items.length),
        letIndexChange = letIndexChange ?? ((_) => true),
        height = height ?? (Platform.isAndroid ? 70.0 : 80.0),
        hasLabel = items.any((item) => item.label != null),
        super(key: key);

  @override
  CurvedNavigationBarState createState() => CurvedNavigationBarState();
}

class CurvedNavigationBarState extends State<CurvedNavigationBar>
    with SingleTickerProviderStateMixin {
  late double _startingPos;
  late double _pos;
  late Widget _icon;
  late AnimationController _animationController;
  late int _length;
  int _endingIndex = 0;
  double _buttonHide = 0;
  bool c1 = true;
  bool c2 = false;
  bool c3 = false;
  bool c4 = false;
  bool c5 = false;

  @override
  void initState() {
    super.initState();
    _icon = widget.items[widget.index].child;
    _length = widget.items.length;
    _pos = widget.index / _length;
    _startingPos = widget.index / _length;
    _animationController = AnimationController(vsync: this, value: _pos);
    _animationController.addListener(() {
      setState(() {
        _pos = _animationController.value;
        final endingPos = _endingIndex / widget.items.length;
        final middle = (endingPos + _startingPos) / 2;
        if ((endingPos - _pos).abs() < (_startingPos - _pos).abs()) {
          _icon = widget.items[_endingIndex].child;
        }
        _buttonHide =
            (1 - ((middle - _pos) / (_startingPos - middle)).abs()).abs();
      });
    });
    colorText = AppColors.white;
  }

  Color colorText = AppColors.white;
  @override
  void didUpdateWidget(CurvedNavigationBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.index != widget.index) {
      final newPosition = widget.index / _length;
      _startingPos = _pos;
      _endingIndex = widget.index;

      _animationController.animateTo(
        newPosition,
        duration: widget.animationDuration,
        curve: widget.animationCurve,
      );
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: widget.height,
      decoration: BoxDecoration(color: Colors.transparent, boxShadow: [
        // BoxShadow(
        //   color: AppColors.white.withOpacity(0.25),
        //   spreadRadius: 0,
        //   blurRadius: 20,
        //   offset: Offset(0, -8), // changes position of shadow
        // ),
      ]),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          // Selected button
          Positioned(
            bottom: widget.height - 100.0,
            left: Directionality.of(context) == TextDirection.rtl
                ? null
                : _pos * size.width,
            right: Directionality.of(context) == TextDirection.rtl
                ? _pos * size.width
                : null,
            width: size.width / _length,
            child: Center(
              child: Transform.translate(
                offset: Offset(0, (_buttonHide - 1) * 80),
                child: Material(
                  color: widget.buttonBackgroundColor ?? widget.color,
                  type: MaterialType.circle,
                  child: Padding(
                    padding: EdgeInsets.all(widget.iconPadding),
                    child: _icon,
                  ),
                ),
              ),
            ),
          ),
          // Background
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: CustomPaint(
              painter: NavCustomPainter(
                startingLoc: _pos,
                itemsLength: _length,
                color: widget.color,
                textDirection: Directionality.of(context),
                hasLabel: widget.hasLabel,
              ),
              child: Container(height: widget.height),
            ),
          ),
          // Unselected buttons
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: SizedBox(
              height: widget.height,
              child: Row(
                children: widget.items.map((item) {
                  return NavBarItemWidget(
                    onTap: (value) {
                      if (!widget.letIndexChange(widget.items.indexOf(item)) ||
                          _animationController.isAnimating) {
                        return;
                      }
                      if (widget.onTap != null) {
                        widget.onTap!(widget.items.indexOf(item));
                      }
                      final newPosition = widget.items.indexOf(item) / _length;
                      setState(() {
                        _startingPos = _pos;
                        _endingIndex = widget.items.indexOf(item);
                        _animationController.animateTo(
                          newPosition,
                          duration: widget.animationDuration,
                          curve: widget.animationCurve,
                        );
                        if (widget.items.indexOf(item) == 0) {
                          c1 = true;
                          c2 = false;
                          c3 = false;
                          c4 = false;
                          c5 = false;
                        }
                        if (widget.items.indexOf(item) == 1) {
                          c1 = false;
                          c2 = true;
                          c3 = false;
                          c4 = false;
                          c5 = false;
                        }
                        if (widget.items.indexOf(item) == 2) {
                          c1 = false;
                          c2 = false;
                          c3 = true;
                          c4 = false;
                          c5 = false;
                        }
                        if (widget.items.indexOf(item) == 3) {
                          c1 = false;
                          c2 = false;
                          c3 = false;
                          c4 = true;
                          c5 = false;
                        }
                        if (widget.items.indexOf(item) == 4) {
                          c1 = false;
                          c2 = false;
                          c3 = false;
                          c4 = false;
                          c5 = true;
                        }
                      });
                    },
                    position: _pos,
                    length: _length,
                    index: widget.items.indexOf(item),
                    child: Center(child: item.child),
                    label: item.label,
                    labelStyle: TextStyle(
                        fontFamily: 'SF Pro Display',
                        fontSize: 8,
                        color: (widget.items.indexOf(item) == 0)
                            ? (c1 == true)
                                ? AppColors.redIcon
                                : AppColors.white
                            : (widget.items.indexOf(item) == 1)
                                ? (c2 == true)
                                    ? AppColors.redIcon
                                    : AppColors.white
                                : (widget.items.indexOf(item) == 2)
                                    ? (c3 == true)
                                        ? AppColors.redIcon
                                        : AppColors.white
                                    : (widget.items.indexOf(item) == 3)
                                        ? (c4 == true)
                                            ? AppColors.redIcon
                                            : AppColors.white
                                        : (c5 == true)
                                            ? AppColors.redIcon
                                            : AppColors.white,
                        fontWeight: FontWeight.w500),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

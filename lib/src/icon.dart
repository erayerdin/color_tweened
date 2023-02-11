// Copyright (c) 2023 Eray Erdin
//
// This software is released under the MIT License.
// https://opensource.org/licenses/MIT

import 'package:flutter/material.dart';

/// An icon that change colors during a provided duration.
/// See official [Icon](https://api.flutter.dev/flutter/widgets/Icon-class.html)
/// class for detailed description.
class ColorTweenedIcon extends StatefulWidget {
  // ignore: public_member_api_docs
  const ColorTweenedIcon(
    this.icon, {
    required this.startColor,
    required this.endColor,
    required this.duration,
    super.key,
    this.size,
    this.fill,
    this.weight,
    this.grade,
    this.opticalSize,
    this.shadows,
    this.semanticLabel,
    this.textDirection,
  });

  /// Starting color of this widget.
  final Color startColor;

  /// Ending color of this widget.
  final Color endColor;

  /// The duration it takes to change from starting color to the ending color.
  final Duration duration;

  // ignore: public_member_api_docs
  final IconData? icon;
  // ignore: public_member_api_docs
  final double? size;
  // ignore: public_member_api_docs
  final double? fill;
  // ignore: public_member_api_docs
  final double? weight;
  // ignore: public_member_api_docs
  final double? grade;
  // ignore: public_member_api_docs
  final double? opticalSize;
  // ignore: public_member_api_docs
  final List<Shadow>? shadows;
  // ignore: public_member_api_docs
  final String? semanticLabel;
  // ignore: public_member_api_docs
  final TextDirection? textDirection;

  @override
  State<ColorTweenedIcon> createState() => _ColorTweenedIconState();
}

class _ColorTweenedIconState extends State<ColorTweenedIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Color?> _colorTween;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: widget.duration)
          ..forward()
          ..addListener(() {
            if (_animationController.isCompleted) {
              _animationController.repeat(reverse: true);
            }
          });
    _colorTween = ColorTween(begin: widget.startColor, end: widget.endColor)
        .animate(_animationController);
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _colorTween,
      builder: (context, child) {
        return Icon(
          widget.icon,
          color: _colorTween.value,
          fill: widget.fill,
          grade: widget.grade,
          opticalSize: widget.opticalSize,
          semanticLabel: widget.semanticLabel,
          shadows: widget.shadows,
          size: widget.size,
          textDirection: widget.textDirection,
          weight: widget.weight,
        );
      },
    );
  }
}

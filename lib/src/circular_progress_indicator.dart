// Copyright (c) 2023 Eray Erdin
//
// This software is released under the MIT License.
// https://opensource.org/licenses/MIT

import 'package:flutter/material.dart';

/// A circular progress indicator that change colors during a provided duration.
/// See official [CircularProgressIndicator](https://api.flutter.dev/flutter/material/CircularProgressIndicator-class.html)
/// class for detailed description.
class ColorTweenedCircularProgressIndicator extends StatefulWidget {
  // ignore: public_member_api_docs
  const ColorTweenedCircularProgressIndicator({
    required this.startColor,
    required this.endColor,
    required this.duration,
    super.key,
    this.value,
    this.backgroundColor,
    this.valueColor,
    this.strokeWidth = 4.0,
    this.semanticsLabel,
    this.semanticsValue,
  });

  /// Starting color of this widget.
  final Color startColor;

  /// Ending color of this widget.
  final Color endColor;

  /// The duration it takes to change from starting color to the ending color.
  final Duration duration;

  // ignore: public_member_api_docs
  final double? value;
  // ignore: public_member_api_docs
  final Color? backgroundColor;
  // ignore: public_member_api_docs
  final Animation<Color?>? valueColor;
  // ignore: public_member_api_docs
  final double strokeWidth;
  // ignore: public_member_api_docs
  final String? semanticsLabel;
  // ignore: public_member_api_docs
  final String? semanticsValue;

  @override
  State<ColorTweenedCircularProgressIndicator> createState() =>
      _ColorTweenedCircularProgressIndicatorState();
}

class _ColorTweenedCircularProgressIndicatorState
    extends State<ColorTweenedCircularProgressIndicator>
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
        return CircularProgressIndicator(
          color: _colorTween.value,
          value: widget.value,
          backgroundColor: widget.backgroundColor,
          valueColor: widget.valueColor,
          strokeWidth: widget.strokeWidth,
          semanticsLabel: widget.semanticsLabel,
          semanticsValue: widget.semanticsValue,
        );
      },
    );
  }
}

/// An extension to change CircularProgressIndicator to
/// ColorTweenedCircularProgressIndicator.
extension ColorTweenedCircularProgressIndicatorExt
    on CircularProgressIndicator {
  /// Change CircularProgressIndicator to ColorTweenedCircularProgressIndicator.
  ColorTweenedCircularProgressIndicator colorTweened({
    required Color startColor,
    required Color endColor,
    required Duration duration,
  }) {
    return ColorTweenedCircularProgressIndicator(
      startColor: startColor,
      endColor: endColor,
      duration: duration,
      backgroundColor: backgroundColor,
      semanticsLabel: semanticsLabel,
      semanticsValue: semanticsValue,
      strokeWidth: strokeWidth,
      value: value,
      valueColor: valueColor,
    );
  }
}

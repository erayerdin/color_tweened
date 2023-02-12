// Copyright (c) 2023 Eray Erdin
//
// This software is released under the MIT License.
// https://opensource.org/licenses/MIT

import 'package:flutter/material.dart';

/// A linear progress indicator that change colors during a provided duration.
/// See official [LinearProgressIndicator](https://api.flutter.dev/flutter/material/LinearProgressIndicator-class.html)
/// class for detailed description.
class ColorTweenedLinearProgressIndicator extends StatefulWidget {
  // ignore: public_member_api_docs
  const ColorTweenedLinearProgressIndicator({
    required this.startColor,
    required this.endColor,
    required this.duration,
    super.key,
    this.value,
    this.backgroundColor,
    this.valueColor,
    this.minHeight,
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
  final double? minHeight;
  // ignore: public_member_api_docs
  final String? semanticsLabel;
  // ignore: public_member_api_docs
  final String? semanticsValue;

  @override
  State<ColorTweenedLinearProgressIndicator> createState() =>
      _ColorTweenedLinearProgressIndicatorState();
}

class _ColorTweenedLinearProgressIndicatorState
    extends State<ColorTweenedLinearProgressIndicator>
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
      builder: (contex, child) => LinearProgressIndicator(
        backgroundColor: widget.backgroundColor,
        color: _colorTween.value,
        minHeight: widget.minHeight,
        semanticsLabel: widget.semanticsLabel,
        semanticsValue: widget.semanticsValue,
        value: widget.value,
        valueColor: widget.valueColor,
      ),
    );
  }
}

/// An extension to change LinearProgressIndicator to
/// ColorTweenedLinearProgressIndicator.
extension ColorTweenedLinearProgressIndicatorExt on LinearProgressIndicator {
  /// Change LinearProgressIndicator to ColorTweenedLinearProgressIndicator.
  ColorTweenedLinearProgressIndicator colorTweened({
    required Color startColor,
    required Color endColor,
    required Duration duration,
  }) {
    return ColorTweenedLinearProgressIndicator(
      startColor: startColor,
      endColor: endColor,
      duration: duration,
      backgroundColor: backgroundColor,
      minHeight: minHeight,
      semanticsLabel: semanticsLabel,
      semanticsValue: semanticsValue,
      value: value,
      valueColor: valueColor,
    );
  }
}

// Copyright (c) 2023 Eray Erdin
//
// This software is released under the MIT License.
// https://opensource.org/licenses/MIT

import 'package:color_tweened/color_tweened.dart';
import 'package:color_tweened_example/extensions.dart';
import 'package:flutter/material.dart';

const Color _startColor = Color(0xffff0f7b);
const Color _endColor = Color(0xfff89b29);
const Duration _duration = Duration(seconds: 2);
const double _iconSize = 32;

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Color Tweened Widgets'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          _buildIcons(context),
        ],
      ).paddingAll(16),
    );
  }

  Widget _buildIcons(BuildContext context) {
    return Column(
      children: [
        Text(
          'ColorTweenedIcon Examples',
          style: Theme.of(context).textTheme.headlineLarge,
        ).paddingAll(16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // with ColorTweenedIcon
            const ColorTweenedIcon(
              Icons.favorite_rounded,
              startColor: _startColor,
              endColor: _endColor,
              duration: _duration,
              size: _iconSize,
            ),
            const ColorTweenedIcon(
              Icons.thumb_up_rounded,
              startColor: _startColor,
              endColor: _endColor,
              duration: _duration,
              size: _iconSize,
            ),
            // with extension
            const Icon(Icons.play_arrow_rounded).colorTweened(
              startColor: _startColor,
              endColor: _endColor,
              duration: _duration,
            ),
            const Icon(Icons.pause_rounded).colorTweened(
              startColor: _startColor,
              endColor: _endColor,
              duration: _duration,
            ),
            const Icon(Icons.stop_rounded).colorTweened(
              startColor: _startColor,
              endColor: _endColor,
              duration: _duration,
            ),
          ],
        ),
      ],
    ).paddingAll(16);
  }
}

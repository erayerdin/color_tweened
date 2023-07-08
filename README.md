# Color Tweened

[![style: very good analysis][very_good_analysis_badge]][very_good_analysis_link]
[![License: MIT][license_badge]][license_link]
![Pub Version](https://img.shields.io/pub/v/color_tweened)

Flutter widgets that change colors during a period of time.

[Check out this demo to see how it looks.](https://erayerdin.github.io/color_tweened/)

This package is in **early release stage** and will be updated frequently.

## Installation

Use the command below:

```sh
flutter pub add color_tweened
```

## How to Use It

You can always check the example code [here](example/lib/home.page.dart).

Here are some example codes with available widgets:

```dart
/////////////////////////
// Color Tweened Icons //
/////////////////////////

// with ColorTweenedIcon
const ColorTweenedIcon(
    Icons.favorite_rounded,
    startColor: Colors.blue,
    endColor: Colors.red,
    duration: Duration(seconds: 2),
    size: 32,
),
const ColorTweenedIcon(
    Icons.thumb_up_rounded,
    startColor: Colors.blue,
    endColor: Colors.red,
    duration: Duration(seconds: 2),
    size: 32,
),

// with extension
const Icon(Icons.play_arrow_rounded).colorTweened(
    startColor: Colors.blue,
    endColor: Colors.red,
    duration: Duration(seconds: 2),
),
const Icon(Icons.pause_rounded).colorTweened(
    startColor: Colors.blue,
    endColor: Colors.red,
    duration: Duration(seconds: 2),
),
const Icon(Icons.stop_rounded).colorTweened(
    startColor: Colors.blue,
    endColor: Colors.red,
    duration: Duration(seconds: 2),
),

///////////////////////////////////////
// Color Tweened Progress Indicators //
///////////////////////////////////////

const ColorTweenedCircularProgressIndicator(
    startColor: Colors.blue,
    endColor: Colors.red,
    duration: Duration(seconds: 2),
),
// or as an extension
const CircularProgressIndicator().colorTweened(
  startColor: Colors.blue,
  endColor: Colors.red,
  duration: Duration(seconds: 2),
),
const ColorTweenedLinearProgressIndicator(
  startColor: Colors.blue,
  endColor: Colors.red,
  duration: Duration(seconds: 2),
),
// or as an extension
const LinearProgressIndicator().colorTweened(
  startColor: Colors.blue,
  endColor: Colors.red,
  duration: Duration(seconds: 2),
),
```

[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[license_link]: https://opensource.org/licenses/MIT
[very_good_analysis_badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis

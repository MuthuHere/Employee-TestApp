import 'package:flutter/material.dart';
import 'package:progress_indicators/progress_indicators.dart';

Widget loadingIndicator() {
  return Padding(
    padding: EdgeInsets.all(10.0),
    child: FadingText('Loading...'),
  );
}

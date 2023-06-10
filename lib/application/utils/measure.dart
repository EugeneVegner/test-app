import 'package:devpace/application/constants/constants.dart';
import 'package:devpace/application/extension/double_ext.dart';
import 'package:flutter/material.dart';

double measureGridHeight(
  int count,
  EdgeInsets padding,
  double maxWidth,
) {
  if (count == 0) return 0;
  final lines = (count / kRrowPerLine).roundUpAbs;
  final hMargin = kDefaultGridAxisSpacing + padding.left + padding.right;
  final rowWidth = (maxWidth - hMargin) / kRrowPerLine;
  final rowHeight = rowWidth / kDefaultGridAspectRatio;
  final vMargin = (lines - 1) * kDefaultGridAxisSpacing + padding.top + padding.bottom;
  final size = lines * rowHeight + vMargin;
  return size;
}

extension DoubleExt on double {
  int get roundUpAbs => isNegative ? floor() : ceil();
}

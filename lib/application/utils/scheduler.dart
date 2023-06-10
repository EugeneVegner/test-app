import 'dart:math';

abstract class Scheduler {
  static void runWithDelay(int milliseconds, Function()? func) => Future.delayed(
        Duration(milliseconds: milliseconds),
        func,
      );

  static void runWithRandomDelay(Function()? func) =>
      runWithDelay(randomValue(min: 256, max: 1024), func);

  static Future<void> randomDelay({
    int min = 256,
    int max = 1024,
  }) =>
      Future.delayed(
        Duration(
          milliseconds: randomValue(
            min: min,
            max: max,
          ),
        ),
      );

  static int randomValue({
    required int min,
    required int max,
  }) =>
      min + Random().nextInt((max + 1) - min);

  static bool randomSuccess() => randomValue(min: 0, max: 1) == 1;
  static bool randomFailure() => randomValue(min: 0, max: 3) == 0;
}

import 'package:devpace/application/extension/double_ext.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Test double round up extension', () {
    test('Round up 0', () {
      expect(0.0.roundUpAbs, 0);
    });
    test('Round up 0.1', () {
      expect(0.1.roundUpAbs, 1);
    });
    test('Round up 1.1', () {
      expect(1.1.roundUpAbs, 2);
    });
    test('Round up 1.6', () {
      expect(1.6.roundUpAbs, 2);
    });
    test('Round up 2.0', () {
      expect(2.0.roundUpAbs, 2);
    });
  });
}

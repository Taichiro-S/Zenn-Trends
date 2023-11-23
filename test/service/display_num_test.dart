import 'package:flutter_test/flutter_test.dart';
import 'package:zenn_trends/pages/ranking/service/display_num.dart';

void main() {
  group('RankedTopic', () {
    test('数字が1000より小さい場合はそのまま出力する', () {
      final numToDisplay = displayNum(123);
      expect(numToDisplay, '123');
    });
    test('数字が1000より大きい場合は1000の位と小数点第一位にkをつけて出力する', () {
      final num1 = displayNum(1000);
      expect(num1, '1.0k');
      final num2 = displayNum(1234);
      expect(num2, '1.2k');
      final num3 = displayNum(12345);
      expect(num3, '12k');
    });
  });
}

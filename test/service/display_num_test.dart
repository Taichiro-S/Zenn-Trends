import 'package:flutter_test/flutter_test.dart';
import 'package:zenn_trends/pages/ranking/service/display_num.dart';

void main() {
  group('displayNum', () {
    test('num < 1000 の時はそのまま出力する', () {
      final num1 = displayNum(123);
      expect(num1, '123');
    });
    test('1000 <= num < 10000 の時は一の位と小数点第一位にkをつけて出力する', () {
      final num1 = displayNum(1000);
      expect(num1, '1.0k');
      final num2 = displayNum(1234);
      expect(num2, '1.2k');
    });
    test('10000 <= num の時は整数部分にkをつけて出力する', () {
      final num1 = displayNum(10000);
      expect(num1, '10k');
      final num2 = displayNum(1234567);
      expect(num2, '1234k');
    });
  });
}

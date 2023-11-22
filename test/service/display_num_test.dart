import 'package:flutter_test/flutter_test.dart';
import 'package:zenn_trends/pages/ranking/service/display_num.dart';

void main() {
  group('RankedTopic', () {
    test('数字が1000より小さい場合はそのまま出力する', () {
      final numToDisplay = displayNum(123);
      expect(numToDisplay, '123');
    });

    // fromDocument メソッドのテスト
    test('数字が1000より大きい場合は1000の位と小数点第一位にkをつけて出力する', () {
      final numToDisplay = displayNum(1234);
      expect(numToDisplay, '1.2k');
    });
  });
}

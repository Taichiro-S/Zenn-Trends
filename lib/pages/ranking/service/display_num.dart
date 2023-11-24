String displayNum(int number) {
  if (number >= 10000) {
    return '${(number ~/ 1000)}k';
  }
  if (10000 > number && number >= 1000) {
    return '${(number / 1000).toStringAsFixed(1)}k';
  } else {
    return number.toString();
  }
}

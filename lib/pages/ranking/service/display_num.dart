String displayNum(int num) {
  if (num >= 10000) {
    return '${(num / 1000).toStringAsFixed(0)}k';
  }
  if (10000 > num && num >= 1000) {
    return '${(num / 1000).toStringAsFixed(1)}k';
  } else {
    return num.toString();
  }
}

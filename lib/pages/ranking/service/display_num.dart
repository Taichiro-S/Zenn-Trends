String displayNum(int num) {
  if (num > 1000) {
    return '${(num / 1000).toStringAsFixed(1)}k';
  } else {
    return num.toString();
  }
}

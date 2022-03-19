
extension DoubleParsing on double {
  num toPrecision(int n) => double.parse(toStringAsFixed(n));
}

class RevenueInfo {
  final String? name;
  final double? rev2021, rev2020;

  RevenueInfo({
    this.name,
    this.rev2020,
    this.rev2021,
  });
  String? getName() {
    return name;
  }

  double? get2021() {
    return rev2021;
  }

  double? get2020() {
    return rev2020;
  }
}

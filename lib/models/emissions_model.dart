
class EmissionsInfo {
  final String name;
  final double? scope1_2020, scope2_2020, scope1_2021, scope2_2021;

  EmissionsInfo({
    required this.name,
    this.scope1_2020,
    this.scope2_2020,
    this.scope1_2021,
    this.scope2_2021,
  });
  String getName() {
    return name;
  }

  double? getScope1_2020() {
    return scope1_2020;
  }

  double? getScope2_2020() {
    return scope2_2020;
  }

  double? getScope1_2021() {
    return scope1_2021;
  }

  double? getScope2_2021() {
    return scope2_2021;
  }
}

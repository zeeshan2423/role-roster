enum RolesType {
  productDesigner,
  flutterDeveloper,
  qaTester,
  productOwner,
}

extension RolesTypeExtension on RolesType {
  String get formattedName {
    switch (this) {
      case RolesType.productDesigner:
        return 'Product Designer';
      case RolesType.flutterDeveloper:
        return 'Flutter Developer';
      case RolesType.qaTester:
        return 'QA Tester';
      case RolesType.productOwner:
        return 'Product Owner';
    }
  }
}

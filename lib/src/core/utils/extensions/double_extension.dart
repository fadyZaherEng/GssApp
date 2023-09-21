import 'package:gss/src/core/utils/constants/strings.dart';

extension NonNullInteger on double? {
  double orZero() {
    if (this == null) {
      return Constants.zeroDouble;
    } else {
      return this!;
    }
  }
}

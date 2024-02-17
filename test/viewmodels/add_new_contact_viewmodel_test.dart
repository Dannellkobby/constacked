import 'package:flutter_test/flutter_test.dart';
import 'package:constacked/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('AddNewContactViewModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}

import 'package:flutter_test/flutter_test.dart';
import 'package:topicdetectionweb/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('SidebarxWidgetModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}

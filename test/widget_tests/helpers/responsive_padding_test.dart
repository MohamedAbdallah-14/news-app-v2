import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:news_app/core/view/widgets/responsive_padding.dart';

import '../../test_utils.dart';

void main() {
  final responsivePadding = makeTestableWidget(
    child: ResponsivePadding(
      key: const Key('ResponsivePadding'),
      mobilePadding: const EdgeInsets.all(10),
      child: Container(),
    ),
  );

  group('ResponsivePadding Test', () {
    testWidgets('ResponsivePadding render correctly', (tester) async {
      await pumpLocalizedWidget(tester, responsivePadding);
      expect(find.byKey(const Key('ResponsivePadding')), findsOneWidget);
    });
  });
}

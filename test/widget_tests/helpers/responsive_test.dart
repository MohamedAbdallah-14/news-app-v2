import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:news_app/core/view/widgets/responsive.dart';

import '../../test_utils.dart';

void main() {
  group('Responsive', () {
    Widget resposive(Size size) => MediaQuery(
          data: MediaQueryData(size: size),
          child: const Responsive(
            mobile: Text('Mobile'),
            tablet: Text('Tablet'),
            desktop: Text('Desktop'),
          ),
        );
    testWidgets('Mobile', (tester) async {
      await pumpLocalizedWidget(tester, resposive(Size.zero));

      expect(find.text('Mobile'), findsOneWidget);
      expect(find.text('Tablet'), findsNothing);
      expect(find.text('Desktop'), findsNothing);
    });

    testWidgets('Tablet', (tester) async {
      await pumpLocalizedWidget(tester, resposive(const Size(740, 740)));

      expect(find.text('Mobile'), findsNothing);
      expect(find.text('Tablet'), findsOneWidget);
      expect(find.text('Desktop'), findsNothing);
    });

    testWidgets('Desktop', (tester) async {
      await pumpLocalizedWidget(tester, resposive(const Size(1440, 1440)));

      expect(find.text('Mobile'), findsNothing);
      expect(find.text('Tablet'), findsNothing);
      expect(find.text('Desktop'), findsOneWidget);
    });
  });
}

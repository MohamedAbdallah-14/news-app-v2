import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:news_app/core/helpers/breakpoints.dart';

void main() {
  const mobile = BreakPoints.mobile;
  const tablet = BreakPoints.tablet;
  const desktop = BreakPoints.desktop;

  group('BreakPoints', () {
    test('mobile', () {
      expect(mobile.minimumWidth, 0);
    });
    test('tablet', () {
      expect(tablet.minimumWidth, 480);
    });
    test('desktop', () {
      expect(desktop.minimumWidth, 1000);
    });

    test('fromWidth', () {
      expect(BreakPoints.fromWidth(480), mobile);
      expect(BreakPoints.fromWidth(481), tablet);
      expect(BreakPoints.fromWidth(1001), desktop);
    });

    testWidgets('isMobile', (tester) async {
      BuildContext? buildContext;

      final widget = MediaQuery(
        data: const MediaQueryData(),
        child: Builder(
          builder: (context) {
            buildContext = context;

            return Container();
          },
        ),
      );

      await tester.pumpWidget(widget);

      expect(BreakPoints.isMobile(buildContext!), true);
    });

    testWidgets('isTablet', (tester) async {
      BuildContext? buildContext;

      final widget = MediaQuery(
        data: const MediaQueryData(size: Size(481, 0)),
        child: Builder(
          builder: (context) {
            buildContext = context;

            return Container();
          },
        ),
      );

      await tester.pumpWidget(widget);

      expect(BreakPoints.isTablet(buildContext!), true);
    });

    testWidgets('isDesktop', (tester) async {
      BuildContext? buildContext;

      final widget = MediaQuery(
        data: const MediaQueryData(size: Size(1001, 0)),
        child: Builder(
          builder: (context) {
            buildContext = context;

            return Container();
          },
        ),
      );

      await tester.pumpWidget(widget);

      expect(BreakPoints.isDesktop(buildContext!), true);
    });

    testWidgets('isNotMobile', (tester) async {
      BuildContext? buildContext;

      final widget = MediaQuery(
        data: const MediaQueryData(size: Size(1001, 0)),
        child: Builder(
          builder: (context) {
            buildContext = context;

            return Container();
          },
        ),
      );

      await tester.pumpWidget(widget);

      expect(BreakPoints.isNotMobile(buildContext!), true);
    });
  });
}

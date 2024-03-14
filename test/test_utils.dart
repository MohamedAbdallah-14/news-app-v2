import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:news_app/l10n/l10n.dart';

Widget makeTestableWidget({
  required Widget child,
  List<BlocProvider>? blocProvider,
}) =>
    blocProvider != null && blocProvider.isNotEmpty
        ? MultiBlocProvider(
            providers: blocProvider,
            child: child,
          )
        : child;

class TestWidget {
  TestWidget(this.widgetinTest, this.context);
  final Widget widgetinTest;
  final BuildContext context;
}

Future<BuildContext> pumpLocalizedWidget(
  WidgetTester tester,
  Widget widget, {
  Locale locale = const Locale('de'),
  bool pumpAndSettle = true,
}) async {
  late BuildContext buildContext;

  final buidlerWidget = Localizations(
    locale: locale,
    delegates: AppLocalizations.localizationsDelegates,
    child: Material(
      child: Builder(
        builder: (context) {
          buildContext = context;

          return widget;
        },
      ),
    ),
  );

  await tester.pumpWidget(
    MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: locale,
      home: buidlerWidget,
    ),
  );
  if (pumpAndSettle) {
    await tester.pumpAndSettle();
  } else {
    await tester.pump();
    await tester.pump();
  }

  return buildContext;
}

T getWidgetWithType<T>({required Key key}) {
  return find.byKey(key).evaluate().single.widget as T;
}

import 'dart:async';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:news_app/core/data/api_manager/models/request/base_request_defaults.dart';
import 'package:news_app/core/dependacy_injection/di.dart';
import 'package:news_app/core/logic/language_cubit/language_cubit.dart';
import 'package:news_app/core/view/app.dart';
import 'package:news_app/flavor.dart';
import 'package:news_app/home/logic/news/news_cubit.dart';
import 'package:path_provider/path_provider.dart';

Future<void> startApp(Flavor flavor) async {
  WidgetsFlutterBinding.ensureInitialized();
  log('Starting app with flavor: ${flavor.name}');
  AppFlavor.instance.flavor = flavor;

  BaseRequestDefaults.instance.baseUrl = AppFlavor.instance.baseUrl;
  initDependencyInjection();
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getApplicationDocumentsDirectory(),
  );

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LanguageCubit(),
        ),
        BlocProvider(
          create: (context) => NewsCubit(di()),
        ),
      ],
      child: const App(),
    ),
  );
}

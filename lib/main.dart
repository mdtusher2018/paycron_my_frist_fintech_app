import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:template/src/config/router/app_router.dart';
import 'src/core/di/dependency_injection.dart';
import 'package:template/src/core/services/snackbar/snackbar_service.dart';
import 'package:template/src/core/services/storage/local_storage_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  LocalStorageService().init();
  FlutterError.onError = (FlutterErrorDetails details) {
    log(
      'Flutter Error: ${details.exception}',
      stackTrace: details.stack,
      name: 'FlutterError',
    );
  };

  Stripe.publishableKey =
      "pk_test_51RINl1PG9XHOcPc0EWzFHpb89UURpt1siYriwsWyU3EUfozu15bmm4M0x7t0KBDZ8FMTHGfo7xoD00SjmA5uK11A00htzh5FBi";
  await Stripe.instance.applySettings();
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final snackBarService = ref.read(snackBarServiceProvider);
    final router = ref.watch(appRouterProvider);
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      child: MaterialApp.router(
        scaffoldMessengerKey: (snackBarService as SnackBarService).messengerKey,
        title: 'Template App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.blue),
        routerConfig: router,
      ),
    );
  }
}

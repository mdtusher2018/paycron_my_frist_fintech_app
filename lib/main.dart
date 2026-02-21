import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:template/src/config/router/app_router.dart';
import 'src/core/di/dependency_injection.dart';
import 'package:template/src/core/services/snackbar/snackbar_service.dart';
import 'package:template/src/core/services/storage/local_storage_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  LocalStorageService().init();

  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final snackBarService = ref.read(snackBarServiceProvider);
    final router = ref.watch(appRouterProvider);
    return MaterialApp.router(
      scaffoldMessengerKey: (snackBarService as SnackBarService).messengerKey,
      title: 'Template App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      routerConfig: router,
    );
  }
}

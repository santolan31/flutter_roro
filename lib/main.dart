import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_roro/config/router/go_router.dart';
import 'package:flutter_roro/config/theme/theme_appbar.dart';
import 'package:flutter_roro/presentation/providers/counter_screen.dart';

void main() async {
  runApp(const ProviderScope(
      child: ProviderScope(
    child: MainApp(),
  )));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final isdarkmode = ref.watch(themeapp);

    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: Apptheme(isDarkmode: isdarkmode).getTheme(),
    );
  }
}

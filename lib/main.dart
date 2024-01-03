import 'package:flutter/material.dart';
import 'package:image_search_app_mvvm/router/routes.dart';

import 'di/di_setup.dart';

void main() {
  diSetup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: ChangeNotifierProvider.value(
      //   value: MainViewModel(),
      //   child: const MainScreen(),
      // ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:image_search_app_mvvm/ui/view/main_screen.dart';
import 'package:image_search_app_mvvm/view_model/main_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: ChangeNotifierProvider.value(
          value: MainViewModel(),
          child: const MainScreen(),
        ));
  }
}

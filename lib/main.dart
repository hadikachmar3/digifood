import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'constants/theme_data.dart';
import 'screens/home_screen.dart';
import 'utils/navigator.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: NavigationService.instance.navigationKey,
      debugShowCheckedModeBanner: false,
      title: 'Digifood App',
      theme: ThemeColorClass.themeData(),
      home: const HomeScreen(),
    );
  }
}

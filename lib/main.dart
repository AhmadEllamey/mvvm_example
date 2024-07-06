import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mvvm_example/feature/counter/presentation/screens/data_base_example.dart';
import 'feature/counter/presentation/screens/counter_screen.dart';
import 'feature/counter/presentation/screens/post_screen.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const PostScreen(),
      // home: const RiverpodStatefulExample(),
      home: const DataBaseExample(),
    );
  }
}

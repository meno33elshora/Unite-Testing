import 'package:flutter/material.dart';
import 'package:unite_testing_app/widget_testing/my_widget.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Testing',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const SizedBox.shrink(),
      home: const MyWidget(
        title: 'T',
        message: 'M',
      ),
    );
  }
}

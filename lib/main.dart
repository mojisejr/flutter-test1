import 'package:flutter/material.dart';
import 'package:expense_tracker/widgets/expense.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: SafeArea(
        child: Expenses(),
      ),
    );
  }
}

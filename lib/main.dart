import 'package:flutter/material.dart';
import 'login_screen.dart';

void main() {
  runApp(const ExamDutyApp());
}

class ExamDutyApp extends StatelessWidget {
  const ExamDutyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ExamDuty+',
      debugShowCheckedModeBanner: false,
      home: const LoginScreen(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutterwind/flutterwind.dart';

void main() {
  runApp(const MyApp());
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
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: FwContainer(
          style: "px-12 py-24 bg-red-500 border-red-700",
          child: Text(
            'Hello, World!',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
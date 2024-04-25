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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FwContainer(
              style:
                  "px-40 py-24 bg-red-500 border-4 border-red-800 rounded-2xl",
              child: FwContainer(
                style: "w-64 h-64 bg-blue-300 rounded-l-3xl",
              ),
            ),
            SizedBox(height: 20),
            FwContainer(
              style: "p-4 bg-green-500",
              child: FwContainer(
                style: "w-40 h-40 bg-blue-300 rounded-md",
              ),
            ),
          ],
        ),
      ),
    );
  }
}

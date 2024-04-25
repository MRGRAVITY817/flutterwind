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
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FwContainer(
              style:
                  "px-40 py-24 bg-red-500 border-4 border-red-800 rounded-2xl",
              child: FwContainer(
                style: "w-64 h-64 bg-blue-300 rounded-l-3xl py-4",
                child: Column(
                  children: [
                    const FwText(
                      style:
                          "text-white/90 text-2xl text-center font-black tracking-widest lowercase",
                      text: "Welcome to FlutterWind!",
                    ),
                    const SizedBox(height: 20),
                    FwText(
                      style: styles([
                        "text-indigo-500 text-2xl text-center",
                        "font-light italic underline underline-offset-4",
                        "decoration-sky-400 decoration-dashed decoration-4",
                      ]),
                      text: "Hello, World!",
                    ),
                    const SizedBox(height: 20),
                    FwText(
                      style: styles([
                        "text-green-500 text-3xl text-center",
                        "font-bold line-through",
                        "decoration-red-500 decoration-wavy decoration-2",
                      ]),
                      text: "000",
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            const FwContainer(
              style: "size-40 bg-blue-300 rounded-xl p-4",
              child: FwText(
                style: "text-white text-4xl",
                text: "Hello, World!",
              ),
            ),
          ],
        ),
      ),
    );
  }
}

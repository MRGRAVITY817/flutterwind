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
      body: SafeArea(
        child: Column(
          children: [
            const FwContainer(
              style: "w-full",
              child: Row(
                children: [
                  FwFlexible(
                    style: "flex-2 h-12 bg-blue-500",
                    child: FwText(
                      style: "text-lg text-white font-bold",
                      text: "Hello",
                    ),
                  ),
                  FwFlexible(
                    style: "flex-1 h-12 bg-green-500",
                    child: FwText(
                      style: "text-lg text-white font-bold",
                      text: "Hello",
                    ),
                  ),
                  FwFlexible(
                    style: "flex-2 h-12 bg-red-500",
                    child: FwText(
                      style: "text-lg text-white font-bold",
                      text: "Hello",
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const FwFlex(
              style: "flex-row h-96 justify-end items-center",
              children: [
                FwContainer(
                  style: "w-16 h-12 bg-blue-500",
                  child: FwText(
                    style: "text-lg text-white font-bold",
                    text: "Hello",
                  ),
                ),
                FwContainer(
                  style: "w-16 h-12 bg-green-500",
                  child: FwText(
                    style: "text-lg text-white font-bold",
                    text: "Hello",
                  ),
                ),
                FwContainer(
                  style: "w-16 h-12 bg-red-500",
                  child: FwText(
                    style: "text-lg text-white font-bold",
                    text: "Hello",
                  ),
                ),
                FwContainer(
                  style: "w-16 h-12 bg-yellow-500 self-stretch",
                  child: FwText(
                    style: "text-lg text-white font-bold",
                    text: "Hello",
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 200,
              child: GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                children: const [
                  FwContainer(
                    style: "w-16 h-12 bg-blue-500",
                    child: FwText(
                      style: "text-lg text-white font-bold",
                      text: "Hello",
                    ),
                  ),
                  FwContainer(
                    style: "w-16 h-12 bg-green-500",
                    child: FwText(
                      style: "text-lg text-white font-bold",
                      text: "Hello",
                    ),
                  ),
                  FwContainer(
                    style: "w-16 h-12 bg-red-500",
                    child: FwText(
                      style: "text-lg text-white font-bold",
                      text: "Hello",
                    ),
                  ),
                  FwContainer(
                    style: "w-16 h-12 bg-yellow-500",
                    child: FwText(
                      style: "text-lg text-white font-bold",
                      text: "Hello",
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

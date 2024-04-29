import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
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
            const FwGrid(
              style: "grid-cols-4 gap-4",
              children: [
                FwContainer(
                  style: "h-12 bg-blue-500",
                  child: FwText(
                    style: "text-lg text-white font-bold",
                    text: "Hello",
                  ),
                ),
                FwContainer(
                  style: "h-12 bg-green-500",
                  child: FwText(
                    style: "text-lg text-white font-bold",
                    text: "Hello",
                  ),
                ),
                FwContainer(
                  style: "h-12 bg-red-500",
                  child: FwText(
                    style: "text-lg text-white font-bold",
                    text: "Hello",
                  ),
                ),
                FwContainer(
                  style: "h-12 bg-teal-500",
                  child: FwText(
                    style: "text-lg text-white font-bold",
                    text: "Hello",
                  ),
                ),
                FwContainer(
                  style: "bg-green-500 col-start-1 col-span-2 h-12",
                ),
              ],
            ),
            LayoutGrid(
              columnSizes: const [auto, auto, auto],
              rowSizes: const [auto, auto],
              children: [
                const FwContainer(
                  style: "bg-yellow-500 h-12",
                ).withGridPlacement(columnStart: 0, columnSpan: 2),
                const FwContainer(
                  style: "bg-blue-500 h-12",
                ).withGridPlacement(columnStart: 1, rowStart: 1),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

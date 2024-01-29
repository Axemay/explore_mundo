import 'package:flutter/material.dart';
import 'destino.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String appTitle = 'Explore o Mundo';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.explore_outlined),
                  const SizedBox(width: 8),
                  const Text(appTitle),
                ],
              ),
            ),
          ),
          backgroundColor: Colors.blue[400],
        ),
        body: SafeArea(
          child: DestinoItemList(),
        ),
      ),
    );
  }
}

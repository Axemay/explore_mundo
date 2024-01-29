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
          title: const Text(appTitle),
          backgroundColor: Colors.blue[400],
        ),
        body: SafeArea(
          child: DestinoItemList(),

        ),
      ),
    );
  }
}

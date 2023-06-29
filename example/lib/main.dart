import 'package:flutter/material.dart';

import 'package:oiti_liveness2d/oiti_liveness2d.dart';
import 'package:oiti_liveness2d/utils.dart';

void main() {
  runApp(const MaterialApp(
    title: "My App",
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final appKey = "APP_KEY";
  final environment = Environment.hml;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(children: [
          const Spacer(),
          Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: ElevatedButton(
                onPressed: () async {
                  OitiLiveness2d().openFaceCaptcha(appKey, environment);
                },
                child: const Text('FaceCaptcha')),
          ),
          ElevatedButton(
              onPressed: () async {
                OitiLiveness2d().openDocumentscopy(appKey, environment);
              },
              child: const Text('Documentscopy')),
          const Spacer()
        ]),
      ),
    );
  }
}

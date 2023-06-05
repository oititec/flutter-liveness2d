import 'package:flutter/material.dart';

import 'package:oiti_liveness2d/oiti_liveness2d.dart';

void main() {
  runApp(const MaterialApp(
    title: "My App",
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(children: [
          const Spacer(),
          const Text('Screen'),
          ElevatedButton(
              onPressed: () async {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => const DocumentscopyWidget()
                //   )
                // );
                const appKey = "APP-KEY";
                final channel = OitiLiveness2d();
                await channel.recordEvent(appKey, 'L2_Start');
              },
              child: const Text('Documentscopy')),
          const Spacer()
        ]),
      ),
    );
  }
}

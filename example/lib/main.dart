import 'package:flutter/material.dart';

import 'package:oiti_liveness2d/oiti_liveness2d.dart';
import 'package:oiti_liveness2d/utils.dart';

void main() {
  runApp(MaterialApp(
    title: "My App",
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  String? ticket = "ticket-123";
  final appKey =
      "eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJjZXJ0aWZhY2UiLCJ1c2VyIjoiMjU4QzlDRTE3QkVEQjk1MDFBRTUzMDdEM0ZDMzU1RjBEfG1vYmlsZS5hcGlnbG9iYWwiLCJlbXBDb2QiOiIwMDAwMDAwNjc5IiwiZmlsQ29kIjoiMDAwMDAwMjc3NCIsImNwZiI6IjYzMDc2NzQ4MDY4Iiwibm9tZSI6IkY0N0I5MTM2RThGOUQyMjM0OTM5QzQyNjc0RUM1Mzg0RDQyRDI0NjRDNjgzRUNCMTg5MkU0OUM2QjgwQUQ1QjJDMzJGNUM4QjNBQThBMDZCMzMyQTMzM0RDMzRFM0U1OTU5M0UyNUQwMzdBMTc3RjM5MDE5Rjk1MTA1Qzc0MENCOTE1NEQ0QjZGfFNRVUFEIE1PQklMRSIsIm5hc2NpbWVudG8iOiIxNS8wMS8xOTk4IiwiZWFzeS1pbmRleCI6IkFBQUFFb25hNVZUelJUQnpnYU9rT3Q1djdFS1hqQ0RFMXZDS1ZkN0oxenQ4V0hiaUF1Wm9oMFdwTHNzN29nPT0iLCJrZXkiOiJUWFZqYUNCbGRtbHNJSE52YjI0Z2FHbG5hQ0JwYmlCb2IzQmxJR1J2SUhacFpYYz0iLCJleHAiOjE2ODYwNTQ4MDgsImlhdCI6MTY4NjA1NDUwOH0.LDt3V14pH3LM2zhyKrN1YYgxyv_FzkIv-xBb2m4PooA";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(children: [
          const Spacer(),
          ElevatedButton(
              onPressed: () async {
                OitiLiveness2d().openDocumentscopy(ticket, appKey, Environment.hml);
              },
              child: const Text('Documentscopy')),
          const Spacer()
        ]),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:oiti_liveness2d/oiti_liveness2d.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  final _oitiLiveness2dPlugin = OitiLiveness2d();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String? platformVersion = "10";
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Liveness + Doc - Flutter'),
        ),
        body: Center(
          child: Column(
            children: [
              Center(
                child: Text(' '),
              ),
              ElevatedButton(
                  onPressed: () async {
                    // var status = await Permission.camera.request();
                    final appKey =
                        "eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJjZXJ0aWZhY2UiLCJ1c2VyIjoiMzZDQkFGNUVFQzdGOTY3MDUwOTQxMEYwQURBNUM0RUI1fG9pdGkuZmFjZXRlYy5obWwiLCJlbXBDb2QiOiIwMDAwMDAwMDAxIiwiZmlsQ29kIjoiMDAwMDAwMjc2OSIsImNwZiI6IjU0MjczOTY2MDg1Iiwibm9tZSI6IjY3MzNEMkY5NDU3OENDNDk0Q0E5NzAwREEyOEQyOTU3RkEyRkE0NkVGNjcyNERERDEyN0FGNDU2RkZGREVENjREQ0I0NTI5NkQ5OTEzRUFCNTYwNTg4QUVEMjBFMUQ2QkQzNTFGOTk5NzhGOUMxMTgwNTEwRjkyMzc4NkNCNUZCfEFTSEFVQVMgQVNVSEFTSFUgQVNVSCIsIm5hc2NpbWVudG8iOiIwOC8xMC8xOTkxIiwiZWFzeS1pbmRleCI6IkFBQUFFdVhGZGZuSWt2RFFKb1VqVXc0eXpHZXFjMm9mOWZNMHZFZFRHMC9rSGhHS1pLbHJDN0VTNlh6OERBPT0iLCJrZXkiOiJRV3hzYjNkaGJtTmxJSEpsY0hWc2MybDJaU0J6WlhnZ2JXRjVJR052Ym5SaGFXND0iLCJleHAiOjE2NzY2NDUwMzgsImlhdCI6MTY3NjY0NDczOH0.7vmPcpNXrb2Gk4rYoK_Rb00_HRHolHxvYwzRr78ABHM";
                    print("\n$appKey\n");
                    try {
                      final x = await OitiLiveness2d.startliveness2d(
                          "https://comercial.certiface.com.br:8443", appKey);
                      print(x);
                    } catch (e) {
                      print(e.toString());
                    }
                  },
                  child: Text("Liveness 2D")),
              ElevatedButton(
                  onPressed: () async {
                    // var status = await Permission.camera.request();
                    final appKey =
                        "eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJjZXJ0aWZhY2UiLCJ1c2VyIjoiMjRFQkYyODdFRkIzQUZFNDVGODE0NDJBRTU3QzhBQTEzfG9pdGkuZmFjZXRlYy5obWwiLCJlbXBDb2QiOiIwMDAwMDAwMDAxIiwiZmlsQ29kIjoiMDAwMDAwMjc2OSIsImNwZiI6IjU0MjczOTY2MDg1Iiwibm9tZSI6IjVDRkFCREUxQUExQUJDODFEQjI3QUY5Q0YyQzg3NTVEOTlGREE1OUVERTY1QzA0MkU4NDZGNzlGNDFFQTU4NEMwMTE3NTY1Rjk5Njc4OTc3NjkwREFEMTAxNDdGRDBDRkYyMjYwRjJFQ0I3RjA3RDg3REI5ODVFRjM3MzNDQkY4fEFTSEFVQVMgQVNVSEFTSFUgQVNVSCIsIm5hc2NpbWVudG8iOiIwOC8xMC8xOTkxIiwiZWFzeS1pbmRleCI6IkFBQUFFb1NIMyt0TXBjcnhaajZiU2VZU25xU1RVeGRhSXlXTHJyZ2NtcWtnSDIrV3pDd2JXWFBONVNFSURnPT0iLCJrZXkiOiJUWFZqYUNCbGRtbHNJSE52YjI0Z2FHbG5hQ0JwYmlCb2IzQmxJR1J2SUhacFpYYz0iLCJleHAiOjE2NzY2NDUxMTUsImlhdCI6MTY3NjY0NDgxNX0.r3ZlagyOSDL4H4_PUkNyXOgLoll6DglkSP8RzU_DS0A";
                    print("\n$appKey\n");
                    try {
                      final x = await OitiLiveness2d.startdocumentscopy(
                          "https://comercial.certiface.com.br:8443", appKey);
                      print(x);
                    } catch (e) {
                      print(e.toString());
                    }
                  },
                  child: Text("Documentoscopia"))
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'dart:async';

import 'package:oiti_liveness2d/oiti_liveness2d.dart';
import 'package:oiti_liveness2d_example/widgets/camera_permission.dart';
import 'package:oiti_liveness2d_example/widgets/documentscopy.dart';

void main() {
  runApp(const MaterialApp(
    title: 'Navigation Basics',
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late TextEditingController _controller;
  late TextEditingController _controllerT;

  String _platformVersion = 'Unknown';
  final _oitiLiveness2dPlugin = OitiLiveness2d();
  var appKey =
      'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJjZXJ0aWZhY2UiLCJ1c2VyIjoiODdFNENDRjZGNjMyNTFDNEJBQThBRERFNjJFMDE1NEZ8aW50LmV2b2x1dGlvbi5obWwiLCJlbXBDb2QiOiIwMDAwMDAwNjczIiwiZmlsQ29kIjoiMDAwMDAwMjczOSIsImNwZiI6IjgxMDQ2MDY0ODQzIiwibm9tZSI6IjVFNDI0N0YwRDQ5QTRERDdEMzQzMEU4QkY3MDBBMEFGOTVFRkIyNEUyRDEyNzRDOTJFMjU5RUEzMDIyQjBBNUUyMEVGQjc0NUNGRjIyOTIzM0YyRjdCMkQ0Q0QzNkMzN0JFQjFEODUzMzM0RUMyODcxNDg4MTVBRDUwMTY3NDQzRkY1MUJ8TU9CSUxFIFRFU1RFIEhNTCIsIm5hc2NpbWVudG8iOiIwMS8wMS8yMDAwIiwiZWFzeS1pbmRleCI6IkFBQUFFa2duZGpqYllwSXIwcndobXEvUjZCT3ZjOWFWK2FkKytnbC9HbjNsVWI2dTE3amVPT09IUE03M1NRPT0iLCJrZXkiOiJRV0pzWlNCaGJpQm9iM0JsSUc5bUlHSnZaSGt1SUVGdWVTQnVZWGtnYzJoNWJtVT0iLCJleHAiOjE3MDA4NDA2NTUsImlhdCI6MTcwMDg0MDM1NX0.7JPIs1NoFFchg38dXYvqgCBBlGT5qRQ6-07tfLod-x0';
  var ticket = '0fc42e15-67b2-4147-b146-57c60aa7b914';
  var resultTitle = '';
  var resultContent = '';
  final environment = Environment.hml;

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String? platformVersion = "10";
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  void initState() {
    super.initState();
    initPlatformState();
    _controller = TextEditingController();
    _controllerT = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    _controllerT.dispose();
    super.dispose();
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
              _liveness2DWidgetOption(
                context,
                'Livneness2D',
              ),
              _documentscopyWidgetOption(
                context,
                'Documentoscopia',
              ),
              _documentscopyWidgetOption(
                context,
                'Documentoscopia Custom',
                themeBuilder: _themeCustomization(),
                instructionWidget: instructionScreen(),
                permissionWidget: CameraPermissionWidget(),
              ),
              _documentscopyWidgetOption(
                context,
                'Doc Intrução & Permissão Custom',
                instructionWidget: instructionScreen(),
                permissionWidget: CameraPermissionWidget(),
              ),
              _documentscopyWidgetOption(
                context,
                'Documentoscopia Intrução Custom',
                instructionWidget: instructionScreen(),
              ),
              _documentscopyWidgetOption(
                context,
                'Documentoscopia Permissão Custom',
                permissionWidget: CameraPermissionWidget(),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(resultContent),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(10),
                child:
                    Text(appKey.isEmpty ? 'Ticket vazio' : 'Ticket disponivel'),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child:
                    Text(appKey.isEmpty ? 'AppKey vazia' : 'AppKey disponivel'),
              ),
              ticketSection(),
              appKeySection()
            ],
          ),
        ),
      ),
    );
  }

  Widget _liveness2DWidgetOption(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 5),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(50),
        ),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OitiLiveness2d.createLiveness2DWidget(
              appKey: appKey,
              environment: environment,
              onSuccess: (result) => _onLiveness2DSuccess(result),
              onError: (error) => _onLiveness2DError(error),
            ),
          ),
        ).whenComplete(
          () => _showAlertDialog(
            context,
            resultTitle,
            resultContent,
          ),
        ),
        child: Text(title),
      ),
    );
  }

  Widget _documentscopyWidgetOption(
    BuildContext context,
    String title, {
    ThemeBuilder? themeBuilder,
    Widget? instructionWidget,
    Widget? permissionWidget,
  }) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 5),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(50),
        ),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OitiLiveness2d.createDocumentscopyWidget(
              appKey: appKey,
              ticket: ticket,
              environment: environment,
              themeBuilder: themeBuilder,
              onSuccess: (result) => _onDocSuccess(result),
              onError: (error) => _onDocError(error),
              instructionWidget: instructionWidget,
              permissionWidget: permissionWidget,
            ),
          ),
        ).whenComplete(
          () => _showAlertDialog(
            context,
            resultTitle,
            resultContent,
          ),
        ),
        child: Text(title),
      ),
    );
  }

  Widget appKeySection() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 45),
      child: TextField(
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'App Key',
        ),
        obscureText: false,
        controller: _controller,
        onSubmitted: (value) => _pasteAppKey(),
      ),
    );
  }

  _pasteAppKey() {
    setState(() => appKey = _controller.text);
    _controller.text = appKey;
  }

  Widget instructionScreen() {
    return DocumentscopyWidget(
      onError: (error) => _onDocError(error),
      onSuccess: (result) => _onDocSuccess(result),
    );
  }

  Widget ticketSection() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
      child: TextField(
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Ticket',
        ),
        obscureText: false,
        controller: _controllerT,
        onSubmitted: (value) => _pasteTicket(),
      ),
    );
  }

  _pasteTicket() {
    setState(() => ticket = _controllerT.text);
    _controllerT.text = ticket;
  }

  Future<void> _showAlertDialog(
      BuildContext context, String resultType, String content) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Resultado: $resultType'),
          content: Text(content),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }

  /// Liveness 3D Callbacks
  _onLiveness2DSuccess(LivenessSuccessResult result) {
    resultTitle = 'Sucesso';
    resultContent =
        'Valid: ${result.valid}\nCodID: ${result.codId}\nCause: ${result.cause}\nProtocol: ${result.protocol}\nScan Result Blob: ${result.scanResultBlob}\n';
  }

  _onLiveness2DError(Object? error) {
    resultTitle = 'Error';
    resultContent = 'Cause: ${error.toString()}';
  }

  _onDocSuccess(DocSuccessResult result) {
    resultTitle = 'Sucesso';
    resultContent =
        'Valid: ${result.valid}\nCodID: ${result.codId}\nCause: ${result.cause}\nProtocol: ${result.protocol}\nScan Result Blob: ${result.scanResultBlob}\n';
  }

  _onDocError(Object? error) {
    resultTitle = 'Error';
    resultContent = 'Cause: ${error.toString()}';
  }

  ThemeBuilder _themeCustomization() {
    return ThemeBuilder()
      //NewCustom Capture
      ..setCaptureBackgroundColor = "#666666";
  }
}

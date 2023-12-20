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
      'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJjZXJ0aWZhY2UiLCJ1c2VyIjoiMDBBRjk1NjlFNkUwODExQTM4RUYzNDc4RDcxNUM3NTV8aW50LmV2b2x1dGlvbi5obWwiLCJlbXBDb2QiOiIwMDAwMDAwNjczIiwiZmlsQ29kIjoiMDAwMDAwMjczOSIsImNwZiI6IjA4NjcwODMzOTU2Iiwibm9tZSI6IkMxMDcxOTlGQkI5OTM1QjA0QzY1RjhEMjQ2RkEzMTdGMkE3MTVDRkEzQTVEM0VEQUM5OEI0ODU0OUI0RjRCM0UxN0MyRDE3NUNDMjE4RkQyMDc0QjExRTRDODQ2NDNDNEZEMzgxRDQ2M0RDMjlGMzJGRjE0N0Y2N0UyNDQ5QzI2MDAyQUZ8TU9CSUxFIFRFU1RFIEhNTCIsIm5hc2NpbWVudG8iOiIwOC8xMC8xOTk2IiwiZWFzeS1pbmRleCI6IkFBQUFFZ1V5Z1l6TFg0QjVFL0dxYWM2b0NFc2VxRVV2b0hLU3g5T0tkN2RuNGp6ejlhWEErc1U4QXM5VHVnPT0iLCJrZXkiOiJRV0pzWlNCaGJpQm9iM0JsSUc5bUlHSnZaSGt1SUVGdWVTQnVZWGtnYzJoNWJtVT0iLCJleHAiOjE3MDMwMDQ4NDcsImlhdCI6MTcwMzAwNDU0N30.8jt4se95QiLDzMxI1AKhuVxQnUK4UWdEUZe8Sm5EMZ0';
  var ticket = '72b0eaf4-9cc7-4fc4-a236-160ea53fcc76';
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
        body: ListView(
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
      ..setCaptureBackgroundColor = "#ff1d0d";
  }
}

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:oiti_liveness2d/actions/permissions.dart';
import 'package:oiti_liveness2d/oiti_liveness2d.dart';

class CameraPermissionWidget extends StatelessWidget {
  var _canCloseWidget = false;
  final _channel = OitiLiveness2d();

  CameraPermissionWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter layout demo',
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 215, 21, 21),
        extendBodyBehindAppBar: true,
        appBar: null,
        body: Column(
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.only(top: 30),
                elevation: 5,
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent.withOpacity(0.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () => Navigator.pop(context),
              child: titleSection,
            ),
            Container(
              padding: const EdgeInsets.all(32),
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 215, 21, 21),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.only(
                        top: 15,
                        bottom: 15,
                        left: 100,
                        right: 100,
                      ),
                      backgroundColor: Color.fromARGB(255, 18, 71, 22),
                      shadowColor: Colors.transparent.withOpacity(0.0),
                      textStyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    onPressed: () {
                      try {
                        PermissionsActions().askPermission(context);
                      } catch (e) {
                        print(e.toString());
                        Navigator.pop(context);
                      }
                    },
                    child: const Text("Verificar"),
                  ),
                ],
              ),
            ),
            Expanded(
              child: permissionDesc,
            ),
            Expanded(
              child: permissionDesc2,
            ),
          ],
        ),
      ),
    );
  }

  Widget titleSection = Container(
    padding: const EdgeInsets.all(32),
    child: Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/images/left-arrow-b.png',
                height: 22,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
      ],
    ),
  );

  Widget permissionDesc = Container(
    padding: const EdgeInsets.only(
      right: 32,
      left: 32,
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: const Text(
                      "Permissões da câmera desativadas.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 45,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );

  Widget permissionDesc2 = Container(
    padding: const EdgeInsets.only(
      right: 32,
      left: 32,
    ),
    child: Expanded(
      child: Row(
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: const Text(
                  "Teste de Tela Customizada",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 25,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );

  Future<void> _showAlertDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: const Text('Precisamos acessar sua câmera'),
          content: const Text(
            'Em seu aparelho, vá em Ajustes e habilite o uso da câmera.',
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Fechar'),
              onPressed: () {
                _canCloseWidget = true;
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Ajustes'),
              onPressed: () {
                _canCloseWidget = false;
                _channel.openSettings().whenComplete(
                      () => Navigator.of(context).pop(),
                    );
              },
            ),
          ],
        );
      },
    );
  }
}

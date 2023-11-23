import 'package:flutter/material.dart';
import 'package:oiti_liveness2d/oiti_liveness2d.dart';

class PermissionsActions {
  final _channel = OitiLiveness2d();

  askPermission(BuildContext context) {
    _channel
        .askPermission()
        .then((granted) => {print(granted), Navigator.pop(context)});
  }
}

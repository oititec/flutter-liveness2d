import 'package:flutter/material.dart';
import 'oiti_liveness2d_platform_interface.dart';

import 'package:oiti_liveness2d/common/enumerations.dart';
import 'package:oiti_liveness2d/common/liveness_success_result.dart';
import 'package:oiti_liveness2d/common/doc_success_result.dart';
import 'package:oiti_liveness2d/common/theme_builder.dart';

import 'package:oiti_liveness2d/widgets/liveness2d.dart';
import 'package:oiti_liveness2d/widgets/documentscopy.dart';

export 'package:oiti_liveness2d/common/enumerations.dart';
export 'package:oiti_liveness2d/common/liveness_success_result.dart';
export 'package:oiti_liveness2d/common/doc_success_result.dart';
export 'package:oiti_liveness2d/common/theme_builder.dart';

export 'package:oiti_liveness2d/actions/documentscopy_actions.dart';
export 'package:oiti_liveness2d/actions/permissions.dart';
export 'package:oiti_liveness2d/actions/global.dart';

class OitiLiveness2d {
  Future<String?> getPlatformVersion() {
    return OitiLiveness2dPlatform.instance.getPlatformVersion();
  }

  static Future startliveness2d(String? baseUrl, String? appKey) async {
    return await OitiLiveness2dPlatform.instance
        .startliveness2d(baseUrl, appKey);
  }

  Future<LivenessSuccessResult> openLiveness2D({
    required String appKey,
    required String baseUrl,
  }) async {
    final result = await OitiLiveness2dPlatform.instance.startliveness2d(
      baseUrl,
      appKey,
    );

    return LivenessSuccessResult(
      result['valid'] as bool? ?? false,
      result['cause'] as String? ?? '',
      result['codId'] as String? ?? '',
      result['protocol'] as String? ?? '',
      result['blob'] as String? ?? '',
    );
  }

  Future<DocSuccessResult> openDocumentscopy({
    required String appKey,
    required String ticket,
    ThemeBuilder? themeBuilder,
    required String baseUrl,
  }) async {
    final result = await OitiLiveness2dPlatform.instance.startDocumentscopy(
      baseUrl,
      appKey,
      ticket,
      themeBuilder?.toJson(),
    );

    return DocSuccessResult(
      result['valid'] as bool? ?? false,
      result['cause'] as String? ?? '',
      result['codId'] as String? ?? '',
      result['protocol'] as String? ?? '',
      result['blob'] as String? ?? '',
    );
  }

  static Future startDocumentscopy(String? baseUrl, String? appKey,
      String? ticket, Object? themeBuilder) async {
    return await OitiLiveness2dPlatform.instance
        .startDocumentscopy(baseUrl, appKey, ticket, themeBuilder);
  }

  Future checkPermission() async {
    return await OitiLiveness2dPlatform.instance.checkPermission();
  }

  Future askPermission() async {
    return await OitiLiveness2dPlatform.instance.askPermission();
  }

  Future<void> openSettings() async {
    return await OitiLiveness2dPlatform.instance.openSettings();
  }

  static Widget createLiveness2DWidget({
    required String appKey,
    required Environment environment,
    required Function(LivenessSuccessResult result) onSuccess,
    required Function(Object? error) onError,
  }) {
    return Liveness2DWidget(
      appKey: appKey,
      environment: environment,
      onSuccess: onSuccess,
      onError: onError,
    );
  }

  static Widget createDocumentscopyWidget(
      {required String appKey,
      required String ticket,
      required Environment environment,
      ThemeBuilder? themeBuilder,
      required Function(DocSuccessResult result) onSuccess,
      required Function(Object? error) onError,
      Widget? instructionWidget,
      Widget? permissionWidget}) {
    return DocumentscopyWidget(
        appKey: appKey,
        ticket: ticket,
        environment: environment,
        themeBuilder: themeBuilder,
        onSuccess: onSuccess,
        onError: onError,
        instructionWidget: instructionWidget,
        permissionWidget: permissionWidget);
  }
}

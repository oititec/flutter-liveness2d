import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oiti_liveness2d/oiti_liveness2d.dart';
import 'package:oiti_liveness2d/widgets/screens/camera_permission.dart';
import 'package:oiti_liveness2d/widgets/components/info_card.dart';

class Liveness2DWidget extends StatelessWidget {
  final String appKey;
  final Environment environment;
  final OitiLiveness2d _channel = OitiLiveness2d();
  final Function(LivenessSuccessResult result) onSuccess;
  final Function(Object? error) onError;

  Liveness2DWidget({
    Key? key,
    required this.appKey,
    required this.environment,
    required this.onSuccess,
    required this.onError,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, child) => MaterialApp(
        title: 'Instruction View',
        builder: (context, child) {
          return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: Scaffold(
                backgroundColor: const Color.fromRGBO(22, 72, 205, 1),
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
                      onPressed: () {
                        onError("User cancelled the journey");
                        Navigator.pop(context);
                      },
                      child: titleSection,
                    ),
                    Image.asset(
                      'assets/images/img_face.png',
                      height: 270.sp,
                      fit: BoxFit.cover,
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding:
                            const EdgeInsets.only(left: 32, right: 32, top: 32),
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(40),
                            topLeft: Radius.circular(40),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: const EdgeInsets.only(bottom: 8),
                                  child: const Text(
                                    'Reconhecimento Facial',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                                Text(
                                  'Isso garante que você é você mesmo.',
                                  style: TextStyle(
                                    color: Colors.grey[500],
                                    fontSize: 12.sp,
                                  ),
                                ),
                              ],
                            ),
                            const Expanded(
                              flex: 1,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  InfoCardWidget(
                                    'assets/images/lightbulb_outline.png',
                                    'Escolha um ambiente bem iluminado.',
                                  ),
                                  InfoCardWidget(
                                    'assets/images/face.png',
                                    'Não use acessórios como bonés, máscaras e afins.',
                                  ),
                                ],
                              ),
                            )
                            /*3*/
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                        top: 0,
                        bottom: 32,
                        left: 32,
                        right: 32,
                      ),
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
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
                              backgroundColor:
                                  const Color.fromARGB(255, 0, 180, 12),
                              shadowColor: Colors.transparent.withOpacity(0.0),
                              textStyle: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                            onPressed: () {
                              _continueAction(context);
                            },
                            child: const Text("Continuar"),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ));
        },
      ),
    );
  }

  void _continueAction(BuildContext context) {
    _channel.checkPermission().then((authorized) => {
          if (authorized)
            {
              _channel
                  .openLiveness2D(
                    appKey: appKey,
                    baseUrl: "",
                    environment: environment,
                  )
                  .then((result) => onSuccess(result))
                  .onError((error, stackTrace) => onError(error))
                  .whenComplete(() => Navigator.pop(context))
            }
          else
            {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CameraPermissionWidget(),
                ),
              )
            }
        });
  }

  final Widget titleSection = Container(
    padding: const EdgeInsets.all(32),
    child: Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/images/left-arrow.png',
                height: 22,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
      ],
    ),
  );

  final Widget navigate = Container(
    padding: const EdgeInsets.only(left: 32, right: 32, top: 32),
    decoration: const BoxDecoration(
      color: Color.fromARGB(255, 255, 255, 255),
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(40),
        topLeft: Radius.circular(40),
      ),
    ),
    child: Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 8),
                child: const Text(
                  'Reconhecimento Facial',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              Text(
                'Isso garante que você é você mesmo.',
                style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oiti_liveness2d/widgets/components/info_card_doc.dart';
import 'package:oiti_liveness2d/oiti_liveness2d.dart';

class DocumentscopyWidgetScreen extends StatelessWidget {
  final Function(BuildContext) continueAction;

  DocumentscopyWidgetScreen({
    Key? key,
    required this.continueAction,
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
                        GlobalActions().onBackInstruction(context);
                        Navigator.pop(context);
                      },
                      child: titleSection,
                    ),
                    Image.asset(
                      'assets/images/img_doc.png',
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
                                    'Envio de documentos',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                                Text(
                                  'Para começarmos, escolha o tipo de documento que deseja enviar:',
                                  style: TextStyle(
                                    color: Colors.grey[500],
                                    fontSize: 12.sp,
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              flex: 1,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(bottom: 20.0),
                                    child: OutlinedButton(
                                      style: OutlinedButton.styleFrom(
                                        padding: const EdgeInsets.only(
                                          top: 5,
                                          bottom: 5,
                                          left: 5,
                                          right: 5,
                                        ),
                                        backgroundColor: const Color.fromARGB(
                                            255, 255, 255, 255),
                                        shadowColor:
                                            Colors.transparent.withOpacity(0.0),
                                        textStyle: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                          color: Color.fromARGB(255, 0, 0, 0),
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                      ),
                                      onPressed: () {
                                        continueAction(context);
                                      },
                                      child: const InfoCardWidget(
                                        'assets/images/cam.png',
                                        'CNH',
                                        'Remova seu documento do plástico e comece.',
                                      ),
                                    ),
                                  ),
                                  OutlinedButton(
                                    style: OutlinedButton.styleFrom(
                                      padding: const EdgeInsets.only(
                                        top: 5,
                                        bottom: 5,
                                        left: 5,
                                        right: 5,
                                      ),
                                      backgroundColor: const Color.fromARGB(
                                        255,
                                        255,
                                        255,
                                        255,
                                      ),
                                      shadowColor:
                                          Colors.transparent.withOpacity(0.0),
                                      textStyle: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        color: Color.fromARGB(255, 0, 0, 0),
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    ),
                                    onPressed: () {
                                      continueAction(context);
                                    },
                                    child: const InfoCardWidget(
                                      'assets/images/cam.png',
                                      'RG',
                                      'Remova seu documento do plástico e comece.',
                                    ),
                                  ),
                                ],
                              ),
                            )
                            /*3*/
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ));
        },
      ),
    );
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

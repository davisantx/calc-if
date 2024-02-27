import 'package:calc_if/src/app/loaded/settings_app.dart';
import 'package:calc_if/src/app/widgets/background_widget.dart';
import 'package:calc_if/src/app/widgets/modal_bottom_sheet_widget.dart';
import 'package:flutter/material.dart';

class ListItemWidget extends StatelessWidget {
  final double nota;
  final String title;
  final String methodCalc;
  final String calc;

  final DateTime dateTime;

  const ListItemWidget({
    super.key,
    required this.title,
    required this.methodCalc,
    required this.calc,
    required this.nota,
    required this.dateTime,
  });

  String convertToViewable(int value) {
    if(value < 10) {
      return '0$value';
    }else {
      return '$value';
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          nota.toStringAsFixed(2),
          style: const TextStyle(
            fontSize: 15,
          )
        ),
      ),
      title: Text(title),
      subtitle: Text('Calculada em ${convertToViewable(dateTime.day)}/${convertToViewable(dateTime.month)}/${dateTime.year}, as ${convertToViewable(dateTime.hour)}:${convertToViewable(dateTime.minute)}:${convertToViewable(dateTime.second)}'),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      onTap: () {
        showModalBottomSheet(
          context: context, 
          backgroundColor: Colors.transparent,
          builder: (context) {
            return Background.withBorder(
              index: SettingsApp.temaAtual, 
              borderRadius: 20,
              content: ModalBottomSheetWithHeaderWidget(
                titleHeader: title,
                content: [
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 50),
                          child: Text(
                            methodCalc,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 22,
                            )
                          ),
                        ),
                        Text(
                          calc,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 20
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 50),
                          child: Text(
                            SettingsApp.limitarCasasDecimais ? nota.toStringAsFixed(2) : nota.toStringAsFixed(5),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 25
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ]
              )
            );
          }
        );
      },
    );
  }
}
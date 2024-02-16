import 'package:calc_if/constants/keys.dart';
import 'package:calc_if/src/records/models/record_model.dart';
import 'package:calc_if/src/app/settings_app.dart';
import 'package:calc_if/storage/storage.dart';

class HomeController {
  void makeRecord({
    required String titleBox, 
    required double note, 
    required String methodCalc, 
    required String calc
  }) {
    var newRecord = RecordModel(
      titleBox: titleBox, 
      note: note,
      methodCalc: methodCalc,
      calc: calc,
      dateTime: DateTime.now()
    );
    if(SettingsApp.registrarRegistros) {
      if(SettingsApp.listaDeRegistros.isEmpty) {
        SettingsApp.listaDeRegistros = [newRecord];
        Storage.save(Keys.records, SettingsApp.listaDeRegistros);
      }else {
        SettingsApp.listaDeRegistros.add(newRecord);
        Storage.save(Keys.records, SettingsApp.listaDeRegistros);
      }
    }
  }
}
import 'package:calc_if/constants/keys.dart';
import 'package:calc_if/src/app/utils/home_page_utils.dart';
import 'package:calc_if/src/records/models/record_model.dart';
import 'package:calc_if/storage/storage.dart';

mixin HomeController {
  final List<Widget> boxes = const <Widget>[
    BoxMediaN1(),
    BoxMediaN2(),
    BoxMediaFinal(),
    BoxMediaAf(),
    BoxMediaComPesos()
  ];

  final PageController controller = PageController(
    viewportFraction: 0.83,
    initialPage: SettingsApp.fixarBox ? SettingsApp.boxFixado : 0
  );

  void onPageChanged(int value) async {
    if(SettingsApp.fixarBox) {
      await controller.positions.isEmpty == false;
      SettingsApp.boxFixado = value;
      Storage.save(Keys.boxFixed, SettingsApp.boxFixado);
    }else {
      SettingsApp.boxFixado = 0;
      Storage.save(Keys.boxFixed, SettingsApp.boxFixado);
    }
  }
  
  static void makeRecord({required RecordModel newRecord, required var outherNote, required var outherPesos}) {
    if(SettingsApp.registrarRegistros) {
      if(outherPesos.runtimeType.toString().contains('List')) {
        for(var i = 0; i < outherNote.length; ++i) {
          if(outherNote[i] == 0.0 || outherNote[i] == null) {
            return;
          }
        }
        for(var i = 0; i < outherPesos.length; ++i) {
          if(outherPesos[i] == 1.0) {
            return;
          } 
        }
        save(newRecord);  
      }else {
        if(outherNote != 0.0 && outherNote != null) {
          save(newRecord);
        }
      }
    }
  }
  static save(RecordModel newRecord) {
    if(SettingsApp.listaDeRegistros.isEmpty) {
      SettingsApp.listaDeRegistros = [newRecord];
      Storage.save(Keys.records, SettingsApp.listaDeRegistros);
    }else {
      SettingsApp.listaDeRegistros.add(newRecord);
        for(var i = 0; i < SettingsApp.listaDeRegistros.length; ++i) {
          if(i + 1 < SettingsApp.listaDeRegistros.length) {
            if(SettingsApp.listaDeRegistros[i].note == SettingsApp.listaDeRegistros[i + 1].note) {
              SettingsApp.listaDeRegistros.removeAt(i + 1);
            }
          }
        }
        Storage.save(Keys.records, SettingsApp.listaDeRegistros);
    }
  }
}
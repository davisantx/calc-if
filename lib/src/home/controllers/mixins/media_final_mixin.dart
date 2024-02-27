import 'package:calc_if/src/app/utils/mixin_media_utils.dart';
import 'package:calc_if/src/home/controllers/home_controller.dart';

mixin MediaFinalMixin <T extends StatefulWidget> on State<T> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final NoteController note = NoteController();

  late final FieldModel field1 = FieldModel(
    title: 'Média da N1', 
    note: note.nota1, 
    textFieldModel: TextFieldModel(
      controller: TextEditingController(), 
      onSaved: (value) {
        note.nota1 = double.parse(value ?? '0');
        HomeController.makeRecord(
          outherNote: note.nota2,
          outherPesos: null,
          newRecord: RecordModel(
            titleBox: 'Media final', 
            note :note.calcularMediaFinal(),
            methodCalc: "((Média da N1 * 2)  + (Média da N2 * 3)) / 5", 
            calc: "((${note.nota1} * 2)  + (${note.nota2} * 3)) / 5",
            dateTime: DateTime.now()
          )
        );
      },
      focusNode: FocusNode(), 
      onValidate: Validator.check,
      onChanged: (value) {
        VerifyChanges.verify(
          formKey: formKey,
        );
        setState((){});
        
      }
    ),
  );

  late final FieldModel field2 = FieldModel(
    title: 'Média da N2',
    note: note.nota2,
    textFieldModel: TextFieldModel(
      controller: TextEditingController(), 
      onSaved: (value) {
        note.nota2 = double.parse(value ?? '0');
        HomeController.makeRecord(
          outherNote: note.nota1,
          outherPesos: null,
          newRecord: RecordModel(
            titleBox: 'Media final', 
            note :note.calcularMediaFinal(),
            methodCalc: "((Média da N1 * 2)  + (Média da N2 * 3)) / 5", 
            calc: "((${note.nota1} * 2)  + (${note.nota2} * 3)) / 5",
            dateTime: DateTime.now()
          ));
      } ,
      focusNode: FocusNode(),
      onValidate: Validator.check,
      onChanged: (value) {
        VerifyChanges.verify(
          formKey: formKey,
        );
        setState((){});
      }
    ),
  );
}
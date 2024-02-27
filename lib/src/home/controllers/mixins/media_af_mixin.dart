import 'package:calc_if/src/app/utils/mixin_media_utils.dart';
import 'package:calc_if/src/home/controllers/home_controller.dart';

mixin MediaAfMixin <T extends StatefulWidget> on State<T> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  
  final NoteController note = NoteController();


  late final FieldModel field1 = FieldModel(
    title: 'Média final', 
    note: note.nota1, 
    textFieldModel: TextFieldModel(
      controller: TextEditingController(), 
      onSaved: (value) {
        note.nota1 = double.parse(value ?? '0');
        HomeController.makeRecord(
          outherPesos: null,
          outherNote: note.nota2,
          newRecord: RecordModel(
              titleBox: 'Média da AF', 
              note: note.calcularMediaAF(),
              methodCalc: "(Média final + Nota da AF) / 2",
              calc: "(${note.nota1} + ${note.nota2}) / 2",
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
        setState(() {});
      }
    ),
  );

  late final FieldModel field2 = FieldModel(
    title: 'Média da AF',
    note: note.nota2,
    textFieldModel: TextFieldModel(
      controller: TextEditingController(), 
      onSaved: (value) {
        note.nota2 = double.parse(value ?? '0');
        HomeController.makeRecord(
          outherNote: note.nota1,
          outherPesos: null,
          newRecord: RecordModel(
              titleBox: 'Média da AF', 
              note: note.calcularMediaAF(),
              methodCalc: "(Média final + Nota da AF) / 2",
              calc: "(${note.nota1} + ${note.nota2}) / 2",
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
        setState(() {});
      }
    ),
  );
}
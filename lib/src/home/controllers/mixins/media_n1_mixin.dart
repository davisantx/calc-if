import 'package:calc_if/src/app/utils/mixin_media_utils.dart';
import 'package:calc_if/src/home/controllers/home_controller.dart';

mixin MediaN1Mixin <T extends StatefulWidget> on State<T> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final NoteController note = NoteController();

  late final FieldModel field1 = FieldModel(
    title: 'Nota N1.1', 
    note: note.nota1, 
    textFieldModel: TextFieldModel(
      controller: TextEditingController(), 
      onSaved: (value) {
        note.nota1 = double.parse(value ?? '0');
        HomeController.makeRecord(
          outherNote: note.nota2,
          outherPesos: null,
          newRecord: RecordModel(
            titleBox: 'Média da N1', 
            note: note.calcularMediaN1(), 
            methodCalc: '(Nota da N1.1 + Nota da N1.2) / 2',
            calc: '(${note.nota1} + ${note.nota2}) / 2',
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
    title: 'Nota N1.2',
    note: note.nota2,
    textFieldModel: TextFieldModel(
      controller: TextEditingController(), 
      onSaved: (value) {
        note.nota2 = double.parse(value ?? '0');
        HomeController.makeRecord(
          outherNote: note.nota1,
          outherPesos: null,
          newRecord: RecordModel(
            titleBox: 'Média da N1', 
            note: note.calcularMediaN1(), 
            methodCalc: '(Nota da N1.1 + Nota da N1.2) / 2',
            calc: '(${note.nota1} + ${note.nota2}) / 2',
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
}
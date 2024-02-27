import 'package:calc_if/src/app/utils/mixin_media_utils.dart';
import 'package:calc_if/src/home/controllers/home_controller.dart';

mixin MediaComPesosMixin <T extends StatefulWidget> on State<T> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final NoteController note = NoteController();

  late final FieldModel pesoField1 = FieldModel(
      title: 'Peso 1', 
      note: note.peso1, 
      textFieldModel: TextFieldModel(
        controller: TextEditingController(), 
        onSaved: (value) {
          note.peso1 = double.parse(value ?? '0');
          HomeController.makeRecord(
            outherNote: [note.nota1, note.nota2],
            outherPesos: [note.peso2],
            newRecord: RecordModel(
              titleBox: 'Média com pesos', 
              note: note.calcularMediaComPesos(),
              methodCalc: '((Nota1 * Peso1) + (Nota2 * Peso2)) / (Peso1 + Peso2)',
              calc: '((${note.nota1} * ${note.peso1}) + (${note.nota2} * ${note.peso2})) / (${note.peso1} + ${note.peso2})',
              dateTime: DateTime.now()
            ),
            
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
        )
    
  );
  
  late final FieldModel pesoField2 = FieldModel(
      title: 'Peso 2', 
      note: note.peso2, 
      textFieldModel: TextFieldModel(
      controller: TextEditingController(), 
      onSaved: (value) {
         note.peso2 = double.parse(value ?? '0');
         HomeController.makeRecord(
          outherNote: [note.nota1, note.nota2],
          outherPesos: [note.peso1],
          newRecord: RecordModel(
            titleBox: 'Média com pesos', 
            note: note.calcularMediaComPesos(),
            methodCalc: '((Nota1 * Peso1) + (Nota2 * Peso2)) / (Peso1 + Peso2)',
            calc: '((${note.nota1} * ${note.peso1}) + (${note.nota2} * ${note.peso2})) / (${note.peso1} + ${note.peso2})',
            dateTime: DateTime.now()
          ), 
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

  late final FieldModel field1 = FieldModel(
    title: 'Nota 1', 
    note: note.nota1, 
    textFieldModel: TextFieldModel(
      controller: TextEditingController(), 
      onSaved: (value) {
        note.nota1 = double.parse(value ?? '0');
        HomeController.makeRecord(
          outherNote: [note.nota2],
          outherPesos: [note.peso1, note.peso2],
          newRecord: RecordModel(
            titleBox: 'Média com pesos', 
            note: note.calcularMediaComPesos(), 
            methodCalc: '((Nota1 * Peso1) + (Nota2 * Peso2)) / (Peso1 + Peso2)',
            calc: '((${note.nota1} * ${note.peso1}) + (${note.nota2} * ${note.peso2})) / (${note.peso1} + ${note.peso2})', 
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
    title: 'Nota 2',
    note: note.nota2,
    textFieldModel: TextFieldModel(
      controller: TextEditingController(), 
      onSaved: (value) {
        note.nota2 = double.parse(value ?? '0');
        HomeController.makeRecord(
          outherNote: [note.nota1],
          outherPesos: [note.peso1, note.peso2],
          newRecord: RecordModel(
          titleBox: 'Média com pesos', 
          note: note.calcularMediaComPesos(), 
          methodCalc: '((Nota1 * Peso1) + (Nota2 * Peso2)) / (Peso1 + Peso2)',
          calc: '((${note.nota1} * ${note.peso1}) + (${note.nota2} * ${note.peso2})) / (${note.peso1} + ${note.peso2})', 
          dateTime: DateTime.now()
        ));
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
import 'package:hive/hive.dart';
part 'record_model.g.dart';

@HiveType(typeId: 0)
class RecordModel {
  
  @HiveField(0)
  final String titleBox;

  @HiveField(1)
  final double note;

  @HiveField(2)
  final String methodCalc;

  @HiveField(3)
  final String calc;

  @HiveField(4)
  final DateTime dateTime;

  RecordModel({
    required this.titleBox,
    required this.note,
    required this.methodCalc,
    required this.calc,
    required this.dateTime,
  });
}
import 'package:json_annotation/json_annotation.dart';

part 'DateWrapper.g.dart';

@JsonSerializable()
class DateWrapper {
  String date;
  int age;

  DateWrapper({
    this.date,
    this.age
  });

  factory DateWrapper.fromJson(Map<String, dynamic> json) => _$DateWrapperFromJson(json);

  Map<String, dynamic> toJson() => _$DateWrapperToJson(this);
}

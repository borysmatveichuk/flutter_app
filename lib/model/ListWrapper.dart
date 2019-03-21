import 'package:flutter_app/model/User.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ListWrapper.g.dart';

@JsonSerializable()
class ListWrapper {
  List<User> results;

  ListWrapper({this.results});

  factory ListWrapper.fromJson(Map<String, dynamic> json) => _$ListWrapperFromJson(json);

  Map<String, dynamic> toJson() => _$ListWrapperToJson(this);
}

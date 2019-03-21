import 'package:json_annotation/json_annotation.dart';

part 'Client.g.dart';

@JsonSerializable()
class Client {
  int id;
  String firstName;
  String lastName;
  @JsonKey(
      name: 'blocked',
      nullable: false,
      toJson: _blockedToJson,
      fromJson: _blockedFromJson)
  bool blocked;

  Client({
    this.id,
    this.firstName,
    this.lastName,
    this.blocked,
  });

  factory Client.fromJson(Map<String, dynamic> json) => _$ClientFromJson(json);

  Map<String, dynamic> toJson() => _$ClientToJson(this);

  static int _blockedToJson(bool blocked) =>
      blocked ? 1 : 0;

  static bool _blockedFromJson(int blocked) =>
      blocked > 0 ? true : false;
}
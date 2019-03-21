import 'package:json_annotation/json_annotation.dart';

import 'package:flutter_app/model/DateWrapper.dart';
import 'package:flutter_app/model/Gender.dart';

part 'User.g.dart';

@JsonSerializable()
class User {
  Gender gender;
  Location location;
  Name name;
  String email;
  @JsonKey(name: "dob")
  DateWrapper dateOfBirth;
  DateWrapper registered;
  String phone;
  String cell;
  Picture picture;
  @JsonKey(name: "nat")
  String nationality;

  User({
    this.gender,
    this.location,
    this.name,
    this.email,
    this.dateOfBirth,
    this.registered,
    this.phone,
    this.cell,
    this.picture,
    this.nationality
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  String toString() {
    return 'User{location: $location, name: $name}';
  }


//String nationality;
//) {
//
//    @Transient
//    val title: String?
//        get() = name.title
//
//    @Transient
//    val firstName: String?
//        get() = name.first
//
//    @Transient
//    val lastName: String?
//        get() = name.last
//
//    @Transient
//    val street: String?
//        get() = "STREET" //location.street
//
//    @Transient
//    val city: String?
//        get() = location.city
//
//    @Transient
//    val state: String?
//        get() = location.state
//
//    @Transient
//    val postcode: String?
//        get() = location.postcode
//
//    @Transient
//    val largePicture: String?
//        get() = picture.large
//
//    @Transient
//    val mediumPicture: String?
//        get() = picture.medium
//
//    @Serializable
//
//
//    @Serializable
//
//
//
}

@JsonSerializable()
class Name {
  String title;
  String first;
  String last;

  Name({
    this.title,
    this.first,
    this.last});

  factory Name.fromJson(Map<String, dynamic> json) => _$NameFromJson(json);

  Map<String, dynamic> toJson() => _$NameToJson(this);

  @override
  String toString() {
    return 'Name{title: $title, first: $first, last: $last}';
  }

}

@JsonSerializable()
class Location {
  String state;

  @JsonKey(
      name: 'postcode',
      nullable: true,
      toJson: _postcodeToJson,
      fromJson: _postcodeFromJson)
  String postcode;

  @JsonKey(name: 'coordinates', nullable: true)
  Coordinates coordinates;
  String city;
  String street;

  Location({
    this.state,
    this.postcode,
    this.coordinates,
    this.city,
    this.street
  });

  factory Location.fromJson(Map<String, dynamic> json) => _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);

  static String _postcodeToJson(dynamic postcode) =>
      postcode.toString();

  static String _postcodeFromJson(dynamic postcode) =>
      postcode.toString();

  @override
  String toString() {
    return 'Location{state: $state, postcode: $postcode, coordinates: $coordinates, city: $city, street: $street}';
  }


}

@JsonSerializable()
class Picture {
  String large;
  String medium;
  String thumbnail;

  Picture({
    this.large,
    this.medium,
    this.thumbnail
  });

  factory Picture.fromJson(Map<String, dynamic> json) => _$PictureFromJson(json);

  Map<String, dynamic> toJson() => _$PictureToJson(this);
}

@JsonSerializable()
class Coordinates {
  String latitude;
  String longitude;

  Coordinates({
    this.latitude,
    this.longitude
  });

  factory Coordinates.fromJson(Map<String, dynamic> json) => _$CoordinatesFromJson(json);

  Map<String, dynamic> toJson() => _$CoordinatesToJson(this);

  @override
  String toString() {
    return 'Coordinates{latitude: $latitude, longitude: $longitude}';
  }


}

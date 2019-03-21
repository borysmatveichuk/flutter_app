// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'User.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
      gender: _$enumDecodeNullable(_$GenderEnumMap, json['gender']),
      location: json['location'] == null
          ? null
          : Location.fromJson(json['location'] as Map<String, dynamic>),
      name: json['name'] == null
          ? null
          : Name.fromJson(json['name'] as Map<String, dynamic>),
      email: json['email'] as String,
      dateOfBirth: json['dob'] == null
          ? null
          : DateWrapper.fromJson(json['dob'] as Map<String, dynamic>),
      registered: json['registered'] == null
          ? null
          : DateWrapper.fromJson(json['registered'] as Map<String, dynamic>),
      phone: json['phone'] as String,
      cell: json['cell'] as String,
      picture: json['picture'] == null
          ? null
          : Picture.fromJson(json['picture'] as Map<String, dynamic>),
      nationality: json['nat'] as String);
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'gender': _$GenderEnumMap[instance.gender],
      'location': instance.location,
      'name': instance.name,
      'email': instance.email,
      'dob': instance.dateOfBirth,
      'registered': instance.registered,
      'phone': instance.phone,
      'cell': instance.cell,
      'picture': instance.picture,
      'nat': instance.nationality
    };

T _$enumDecode<T>(Map<T, dynamic> enumValues, dynamic source) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }
  return enumValues.entries
      .singleWhere((e) => e.value == source,
          orElse: () => throw ArgumentError(
              '`$source` is not one of the supported values: '
              '${enumValues.values.join(', ')}'))
      .key;
}

T _$enumDecodeNullable<T>(Map<T, dynamic> enumValues, dynamic source) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source);
}

const _$GenderEnumMap = <Gender, dynamic>{
  Gender.male: 'male',
  Gender.female: 'female'
};

Name _$NameFromJson(Map<String, dynamic> json) {
  return Name(
      title: json['title'] as String,
      first: json['first'] as String,
      last: json['last'] as String);
}

Map<String, dynamic> _$NameToJson(Name instance) => <String, dynamic>{
      'title': instance.title,
      'first': instance.first,
      'last': instance.last
    };

Location _$LocationFromJson(Map<String, dynamic> json) {
  return Location(
      state: json['state'] as String,
      postcode: json['postcode'] == null
          ? null
          : Location._postcodeFromJson(json['postcode']),
      coordinates: json['coordinates'] == null
          ? null
          : Coordinates.fromJson(json['coordinates'] as Map<String, dynamic>),
      city: json['city'] as String,
      street: json['street'] as String);
}

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'state': instance.state,
      'postcode': instance.postcode == null
          ? null
          : Location._postcodeToJson(instance.postcode),
      'coordinates': instance.coordinates,
      'city': instance.city,
      'street': instance.street
    };

Picture _$PictureFromJson(Map<String, dynamic> json) {
  return Picture(
      large: json['large'] as String,
      medium: json['medium'] as String,
      thumbnail: json['thumbnail'] as String);
}

Map<String, dynamic> _$PictureToJson(Picture instance) => <String, dynamic>{
      'large': instance.large,
      'medium': instance.medium,
      'thumbnail': instance.thumbnail
    };

Coordinates _$CoordinatesFromJson(Map<String, dynamic> json) {
  return Coordinates(
      latitude: json['latitude'] as String,
      longitude: json['longitude'] as String);
}

Map<String, dynamic> _$CoordinatesToJson(Coordinates instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ListWrapper.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListWrapper _$ListWrapperFromJson(Map<String, dynamic> json) {
  return ListWrapper(
      results: (json['results'] as List)
          ?.map((e) =>
              e == null ? null : User.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$ListWrapperToJson(ListWrapper instance) =>
    <String, dynamic>{'results': instance.results};

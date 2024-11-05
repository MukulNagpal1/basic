// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'first.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

First _$FirstFromJson(Map<String, dynamic> json) => First(
      userId: (json['userId'] as num?)?.toInt(),
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      body: json['body'] as String?,
    );

Map<String, dynamic> _$FirstToJson(First instance) => <String, dynamic>{
      'userId': instance.userId,
      'id': instance.id,
      'title': instance.title,
      'body': instance.body,
    };

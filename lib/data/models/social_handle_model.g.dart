// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'social_handle_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SocialHandleModel _$SocialHandleModelFromJson(Map<String, dynamic> json) =>
    SocialHandleModel(
      type: json['type'] as String?,
      label: json['label'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$SocialHandleModelToJson(SocialHandleModel instance) =>
    <String, dynamic>{
      'type': instance.type,
      'label': instance.label,
      'url': instance.url,
    };

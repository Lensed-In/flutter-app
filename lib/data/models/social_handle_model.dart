import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:profile/domain/entities/social_handle_entity.dart';

part 'social_handle_model.g.dart';

@JsonSerializable()
class SocialHandleModel extends SocialHandleEntity {
  SocialHandleModel({
    String? type,
    String? label,
    String? url,
  }) : super(
          type: type,
          label: label,
          url: url,
        );

  factory SocialHandleModel.fromEntity(SocialHandleEntity entity) =>
      SocialHandleModel(
        type: entity.type,
        label: entity.label,
        url: entity.url,
      );

  static List<SocialHandleModel> fromEntityList(
          List<SocialHandleEntity>? entityList) =>
      entityList != null
          ? entityList
              .map((entity) => SocialHandleModel.fromEntity(entity))
              .toList()
          : [];

  factory SocialHandleModel.fromJson(Map<String, dynamic> json) =>
      _$SocialHandleModelFromJson(json);

  Map<String, dynamic> toJson() => _$SocialHandleModelToJson(this);

  static List<SocialHandleModel> fromJsonList(Iterable? jsonList) {
    final List<SocialHandleModel> list = [];
    if (jsonList != null && List<dynamic>.from(jsonList).isNotEmpty) {
      for (final Map<String, dynamic> item in jsonList) {
        list.add(SocialHandleModel.fromJson(item));
      }
    }
    return list;
  }

  static List<Map<String, dynamic>> toJsonList(List<SocialHandleEntity>? list) {
    return (list != null && list.isNotEmpty ? list : [])
        .map((entity) => SocialHandleModel.fromEntity(entity).toJson())
        .toList();
  }


  factory SocialHandleModel.fromJsonString(String? jsonString) {
    if (jsonString != null) {
      final Map<String, dynamic> data = json.decode(jsonString);
      return SocialHandleModel.fromJson(data);
    }
    return SocialHandleModel();
  }

  String toJsonString() {
    final jsonMap = toJson();
    return json.encode(jsonMap);
  }
}

import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:profile/common/constants/json_keys_constants.dart';
import 'package:profile/common/util/app_utils.dart';
import 'package:profile/data/models/social_handle_model.dart';
import 'package:profile/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    String? id,
    String? name,
    String? email,
    String? username,
    String? profilePic,
    String? password,
    String? bio,
    String? accessToken,
    bool? isEmailVerified,
    String? location,
    List<String>? interests,
    List<String>? titles,
    List<String>? purposes,
    List<SocialHandleModel>? socialHandles,
    String? ethAddress,
    String? solAddress,
  }) : super(
          id: id,
          name: name,
          email: email,
          username: username,
          profilePic: profilePic,
          password: password,
          bio: bio,
          accessToken: accessToken,
          isEmailVerified: isEmailVerified,
          location: location,
          interests: interests,
          titles: titles,
          purposes: purposes,
          socialHandles: socialHandles,
          ethAddress: ethAddress,
          solAddress: solAddress,
        );

  factory UserModel.fromEntity(UserEntity? entity) {
    if (entity != null) {
      UserModel(
        id: entity.id,
        name: entity.name,
        email: entity.email,
        username: entity.username,
        profilePic: entity.profilePic,
        password: entity.password,
        bio: entity.bio,
        accessToken: entity.accessToken,
        isEmailVerified: entity.isEmailVerified,
        location: entity.location,
        interests: entity.interests,
        titles: entity.titles,
        purposes: entity.purposes,
        socialHandles: SocialHandleModel.fromEntityList(entity.socialHandles),
        ethAddress: entity.ethAddress,
        solAddress: entity.solAddress,
      );
    }
    return UserModel();
  }

  factory UserModel.fromJson(Map<String, dynamic> jsonMap) {
    return UserModel(
      id: jsonMap[JsonKeysConstants.id],
      name: jsonMap[JsonKeysConstants.name],
      username: jsonMap[JsonKeysConstants.username],
      email: jsonMap[JsonKeysConstants.email],
      profilePic: jsonMap[JsonKeysConstants.profilePic],
      password: jsonMap[JsonKeysConstants.password],
      bio: jsonMap[JsonKeysConstants.bio],
      accessToken: jsonMap[JsonKeysConstants.accessToken],
      isEmailVerified: jsonMap[JsonKeysConstants.isEmailVerified],
      location: jsonMap[JsonKeysConstants.location],
      interests: fromJsonToStringList(jsonMap[JsonKeysConstants.interests]),
      titles: fromJsonToStringList(jsonMap[JsonKeysConstants.titles]),
      purposes: fromJsonToStringList(jsonMap[JsonKeysConstants.purposes]),
      socialHandles: SocialHandleModel.fromJsonList(
          jsonMap[JsonKeysConstants.socialHandles]),
      ethAddress: jsonMap[JsonKeysConstants.ethAddress],
      solAddress: jsonMap[JsonKeysConstants.solAddress],
    );
  }

  Map<String, dynamic> toJson() {
    final json = {
      JsonKeysConstants.id: id,
      JsonKeysConstants.name: name,
      JsonKeysConstants.email: email,
      JsonKeysConstants.username: username,
      JsonKeysConstants.profilePic: profilePic,
      JsonKeysConstants.password: password,
      JsonKeysConstants.bio: bio,
      JsonKeysConstants.accessToken: accessToken,
      JsonKeysConstants.isEmailVerified: isEmailVerified,
      JsonKeysConstants.location: location,
      JsonKeysConstants.interests: interests,
      JsonKeysConstants.titles: titles,
      JsonKeysConstants.purposes: purposes,
      JsonKeysConstants.socialHandles:
          SocialHandleModel.toJsonList(socialHandles),
      JsonKeysConstants.ethAddress: ethAddress,
      JsonKeysConstants.solAddress: solAddress,
    };

    return json;
  }

  factory UserModel.fromJsonString(String? jsonString) {
    if (jsonString != null) {
      final Map<String, dynamic> data = json.decode(jsonString);
      return UserModel.fromJson(data);
    }
    return UserModel();
  }

  String toJsonString() {
    final jsonMap = toJson();
    return json.encode(jsonMap);
  }
}

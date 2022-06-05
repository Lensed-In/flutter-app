import 'package:profile/domain/entities/social_handle_entity.dart';

class UserEntity {
  final String? id;
  final String? name;
  final String? email;
  final String? username;
  final String? profilePic;
  final String? password;
  final String? bio;
  final String? accessToken;
  final bool? isEmailVerified;
  final String? location;
  final List<String>? interests;
  final List<String>? titles;
  final List<String>? purposes;
  final List<SocialHandleEntity>? socialHandles;
  final String? ethAddress;
  final String? solAddress;

  UserEntity({
    this.id,
    this.name,
    this.email,
    this.username,
    this.profilePic,
    this.password,
    this.bio,
    this.accessToken,
    this.isEmailVerified,
    this.location,
    this.interests,
    this.titles,
    this.purposes,
    this.socialHandles,
    this.ethAddress,
    this.solAddress,
  });
}

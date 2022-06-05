import 'package:profile/common/constants/json_keys_constants.dart';
import 'package:profile/domain/entities/sign_up_request_entity.dart';

class SignUpRequestModel extends SignUpRequestEntity {
  SignUpRequestModel({
    required String name,
    required String email,
    required String password,
  }) : super(
          name: name,
          email: email,
          password: password,
        );

  factory SignUpRequestModel.fromEntity(SignUpRequestEntity entity) =>
      SignUpRequestModel(
        name: entity.name,
        email: entity.email,
        password: entity.password,
      );

  Map<String, dynamic> toJson() => {
        JsonKeysConstants.name: name,
        JsonKeysConstants.email: email,
        JsonKeysConstants.password: password,
      };
}

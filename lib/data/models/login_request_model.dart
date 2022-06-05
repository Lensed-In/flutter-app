import 'package:profile/common/constants/json_keys_constants.dart';
import 'package:profile/domain/entities/login_request_entity.dart';

class LoginRequestModel extends LoginRequestEntity {
  LoginRequestModel({
    required String email,
    required String password,
  }) : super(
          email: email,
          password: password,
        );

  Map<String, dynamic> toJson() => {
        JsonKeysConstants.username: email,
        JsonKeysConstants.password: password,
      };

  factory LoginRequestModel.fromEntity(LoginRequestEntity entity) {
    return LoginRequestModel(
      email: entity.email,
      password: entity.password,
    );
  }
}

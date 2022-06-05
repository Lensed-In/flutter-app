import 'package:profile/common/constants/exception_constants.dart';
import 'server_exception.dart';

class ForbiddenException extends ServerException {
  ForbiddenException(String error)
      : super(
          codeInt: ExceptionConstants.forbiddenCode,
          codeString: ExceptionConstants.forbiddenString,
          message: error,
        );
}

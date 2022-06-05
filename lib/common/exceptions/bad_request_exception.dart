import 'package:profile/common/constants/exception_constants.dart';

import 'server_exception.dart';

class BadRequestException extends ServerException {
  BadRequestException(String error)
      : super(
          codeInt: ExceptionConstants.badRequestCode,
          codeString: ExceptionConstants.badRequestString,
          message: error,
        );
}

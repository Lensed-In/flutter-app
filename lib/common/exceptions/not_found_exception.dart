import 'package:profile/common/constants/exception_constants.dart';
import 'server_exception.dart';

class NotFoundException extends ServerException {
  NotFoundException(String error)
      : super(
          codeInt: ExceptionConstants.notFoundCode,
          codeString: ExceptionConstants.notFoundString,
          message: error,
        );
}

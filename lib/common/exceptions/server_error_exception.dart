import 'package:profile/common/constants/exception_constants.dart';
import 'server_exception.dart';

class ServerErrorException extends ServerException {
  ServerErrorException(String error)
      : super(
          codeInt: ExceptionConstants.internalServerErrorCode,
          codeString: ExceptionConstants.internalServerErrorString,
          message: error,
        );
}

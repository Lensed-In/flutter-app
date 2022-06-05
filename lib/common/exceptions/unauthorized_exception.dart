import 'package:profile/common/constants/exception_constants.dart';
import 'package:profile/common/event_bus/event_bus.dart';
import 'package:profile/presentation/event_bus/authentication/authentication_subscriber.dart';

import 'server_exception.dart';

class UnauthorisedException extends ServerException {
  UnauthorisedException(
    String error, {
    String? url,
  }) : super(
          codeInt: ExceptionConstants.unauthorizedCode,
          codeString: ExceptionConstants.unauthorizedString,
          message: error,
        ){
    EventBus.emit<AuthenticationSubscriberEvent>(LogoutSubscriberEvent());
  }
}

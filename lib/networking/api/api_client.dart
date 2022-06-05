import 'package:profile/config/configuration.dart';
import 'package:profile/networking/http/http_client.dart';
import 'package:profile/networking/http/http_constants.dart';

class ApiClient extends HttpClient {
  ApiClient()
      : super(
          host: Configuration.apiHostUrl,
          header: {
            HttpConstants.contentType: HttpConstants.jsonContentType,
          },
        );

  void updateAuthorizationHeader(String? accessToken) {
    header = {
      ...header,
      HttpConstants.authorization: '${HttpConstants.bearer} $accessToken',
    };
  }

  Map<String, String> getClientAuthenticationHeader() => header;
}

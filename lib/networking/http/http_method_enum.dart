enum HttpMethodType { post, get, put, patch, delete }

class HttpMethod {
  HttpMethodType type;

  HttpMethod({required this.type});

  @override
  String toString() {
    switch (type) {
      case HttpMethodType.post:
        return 'POST';
      case HttpMethodType.get:
        return 'GET';
      case HttpMethodType.put:
        return 'PUT';
      case HttpMethodType.patch:
        return 'PATCH';
      case HttpMethodType.delete:
        return 'DELETE';
      default:
        return '';
    }
  }
}

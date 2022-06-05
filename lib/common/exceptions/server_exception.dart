class ServerException implements Exception {
  final int codeInt;
  final String codeString;
  final String message;

  ServerException({
    required this.codeInt,
    required this.codeString,
    required this.message,
  });
}

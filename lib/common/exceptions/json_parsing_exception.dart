class JsonParsingException implements Exception {
	// TODO(Bhushan): Decide and assign code for incomplete/improper json data.
  final int? code;
  final String? message;

  JsonParsingException({this.code, this.message});
}

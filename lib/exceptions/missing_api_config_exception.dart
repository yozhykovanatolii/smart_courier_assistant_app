class MissingApiConfigException implements Exception {
  MissingApiConfigException(this.errorMessage);

  final String errorMessage;

  @override
  String toString() => 'MissingApiConfigException: $errorMessage';
}

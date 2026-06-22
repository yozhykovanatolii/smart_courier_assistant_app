class MissingSupabaseConfigException implements Exception {
  MissingSupabaseConfigException(this.errorMessage);

  final String errorMessage;

  @override
  String toString() => 'MissingSupabaseConfigException: $errorMessage';
}

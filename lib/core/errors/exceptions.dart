/// Thrown when a data source fails to provide data.
/// Kept generic on purpose since we only have one data source type today
/// (local mock); if a network exception type is needed later, it can
/// extend or replace this without touching the domain or presentation layers.
class DataFetchException implements Exception {
  const DataFetchException(this.message);

  final String message;

  @override
  String toString() => 'DataFetchException: $message';
}
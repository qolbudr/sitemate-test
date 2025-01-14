class ConnectionException implements Exception {
  final num? code;
  final String? message;

  const ConnectionException({this.code, this.message});
}

class ServerException implements Exception {
  final num? code;
  final String? message;

  const ServerException({this.code, this.message});
}

class ClientException implements Exception {
  final String? message;

  const ClientException({this.message});
}
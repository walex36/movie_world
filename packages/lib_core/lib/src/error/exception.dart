class ServerException implements Exception {
  final String message;

  ServerException({this.message = 'Erro com o servidor'});
}

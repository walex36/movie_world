abstract class IHomeRemoteDatasource {
  Future<List<Map<String, dynamic>>> getTrending({required int page});
}

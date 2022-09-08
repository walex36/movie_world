import 'package:lib_endpoint/src/domain/enums/endpoint_type_enum.dart';

class Endpoint {
  final String _baseUrl;
  final String _sufix;
  final EndpointType _type;

  String get baseUrl => _baseUrl;
  String get sufix => _sufix;
  EndpointType get type => _type;

  Endpoint._internal({
    required String baseUrl,
    required String sufix,
    required EndpointType type,
  })  : _baseUrl = baseUrl,
        _sufix = sufix,
        _type = type;

  factory Endpoint.development() {
    return Endpoint._internal(
      baseUrl: 'https://api.themoviedb.org/3',
      type: EndpointType.development,
      sufix: '_dev',
    );
  }

  factory Endpoint.homologation() {
    return Endpoint._internal(
      baseUrl: 'https://api.themoviedb.org/3',
      type: EndpointType.homologation,
      sufix: '_homol',
    );
  }

  factory Endpoint.production() {
    return Endpoint._internal(
      baseUrl: 'https://api.themoviedb.org/3',
      type: EndpointType.production,
      sufix: '',
    );
  }

  Endpoint copyWith({
    String? baseUrl,
    String? sufix,
    EndpointType? type,
  }) {
    return Endpoint._internal(
      baseUrl: baseUrl ?? _baseUrl,
      sufix: sufix ?? _sufix,
      type: type ?? _type,
    );
  }
}

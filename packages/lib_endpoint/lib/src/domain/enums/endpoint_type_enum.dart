
import 'package:flutter/foundation.dart';

enum EndpointType {development, homologation, production}

extension EndpointTypeExtension on EndpointType {
  String toFormattedString(){
    switch (this) {
      case EndpointType.development:
        return 'Desenvolvimento';
      case EndpointType.homologation:
        return 'Homologação';
        case EndpointType.production:
        return 'Produção';
    }
  }

  String toShortString() => describeEnum(this);

  bool get isDevelopment => this == EndpointType.development;
  bool get isHomologation => this == EndpointType.homologation;
  bool get isProduction => this == EndpointType.production;
}
import 'dart:convert';

import 'package:lib_core/lib_core.dart';

class WatchBuyModel extends WatchBuy {
  const WatchBuyModel({
    required int displayPriority,
    required String logoPath,
    required int providerId,
    required String providerName,
  }) : super(
          displayPriority: displayPriority,
          logoPath: logoPath,
          providerId: providerId,
          providerName: providerName,
        );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'displayPriority': displayPriority,
      'logoPath': logoPath,
      'providerId': providerId,
      'providerName': providerName,
    };
  }

  factory WatchBuyModel.fromMap(Map<String, dynamic> map) {
    return WatchBuyModel(
      displayPriority: map['display_priority'] ?? 0,
      logoPath: map['logo_path'] == null
          ? ''
          : 'https://image.tmdb.org/t/p/w500${map['logo_path']}',
      providerId: map['provider_id'] ?? 0,
      providerName: map['provider_name'] ?? '',
    );
  }

  WatchBuy toEntity() {
    return WatchBuy(
      displayPriority: displayPriority,
      logoPath: logoPath,
      providerId: providerId,
      providerName: providerName,
    );
  }

  factory WatchBuyModel.fromEntity(WatchBuy watchBuy) {
    return WatchBuyModel(
      displayPriority: watchBuy.displayPriority,
      logoPath: watchBuy.logoPath,
      providerId: watchBuy.providerId,
      providerName: watchBuy.providerName,
    );
  }

  String toJson() => json.encode(toMap());

  factory WatchBuyModel.fromJson(String source) =>
      WatchBuyModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'WatchBuyModel(displayPriority: $displayPriority, logoPath: $logoPath, providerId: $providerId, providerName: $providerName)';
  }
}

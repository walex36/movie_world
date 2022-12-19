import 'dart:convert';

import 'package:lib_core/lib_core.dart';

class WatchCountryModel extends WatchCountry {
  const WatchCountryModel({
    required String link,
    required CountryModel countryModel,
    required List<WatchBuyModel> flatrate,
    required List<WatchBuyModel> rent,
    required List<WatchBuyModel> buy,
  }) : super(
          link: link,
          country: countryModel,
          flatrate: flatrate,
          rent: rent,
          buy: buy,
        );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'link': link,
      'country': country.toString(),
      'flatrate': flatrate.map((x) => x.toString()).toList(),
      'rent': rent.map((x) => x.toString()).toList(),
      'buy': buy.map((x) => x.toString()).toList(),
    };
  }

  factory WatchCountryModel.fromMap(String key, Map<String, dynamic> map) {
    return WatchCountryModel(
      link: map['link'] ?? '',
      countryModel: CountryModel(iso31661: '', name: key),
      flatrate: map['flatrate'] == null
          ? []
          : List<WatchBuyModel>.from(
              map['flatrate'].map<WatchBuyModel>(
                  (x) => WatchBuyModel.fromMap(x as Map<String, dynamic>)),
            ),
      rent: map['rent'] == null
          ? []
          : List<WatchBuyModel>.from(
              map['rent'].map(
                (x) => WatchBuyModel.fromMap(x as Map<String, dynamic>),
              ),
            ),
      buy: map['buy'] == null
          ? []
          : List<WatchBuyModel>.from(
              map['buy'].map(
                (x) => WatchBuyModel.fromMap(x as Map<String, dynamic>),
              ),
            ),
    );
  }

  WatchCountry toEntity() {
    return WatchCountry(
      link: link,
      country: country,
      flatrate: flatrate,
      rent: rent,
      buy: buy,
    );
  }

  factory WatchCountryModel.fromEntity(WatchCountry watchCountry) {
    return WatchCountryModel(
      link: watchCountry.link,
      countryModel: CountryModel.fromEntity(watchCountry.country),
      flatrate: List<WatchBuyModel>.from(
          watchCountry.flatrate.map(WatchBuyModel.fromEntity)),
      rent: List<WatchBuyModel>.from(
          watchCountry.rent.map(WatchBuyModel.fromEntity)),
      buy: List<WatchBuyModel>.from(
          watchCountry.buy.map(WatchBuyModel.fromEntity)),
    );
  }

  String toJson() => json.encode(toMap());

  factory WatchCountryModel.fromJson(String source) =>
      WatchCountryModel.fromMap('', json.decode(source));

  @override
  String toString() {
    return 'WatchCountryModel(link: $link, country: $country, flatrate: $flatrate, rent: $rent, buy: $buy)';
  }
}

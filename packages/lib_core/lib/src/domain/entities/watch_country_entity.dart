// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:lib_core/lib_core.dart';
import 'package:lib_dependencies/lib_dependencies.dart';

class WatchCountry extends Equatable {
  final String link;
  final Country country;
  final List<WatchBuy> flatrate;
  final List<WatchBuy> rent;
  final List<WatchBuy> buy;

  const WatchCountry({
    required this.link,
    required this.country,
    required this.flatrate,
    required this.rent,
    required this.buy,
  });

  @override
  List<Object?> get props => [
        link,
        country,
        flatrate,
        rent,
        buy,
      ];

  WatchCountry copyWith({
    String? link,
    Country? country,
    List<WatchBuy>? flatrate,
    List<WatchBuy>? rent,
    List<WatchBuy>? buy,
  }) {
    return WatchCountry(
      link: link ?? this.link,
      country: country ?? this.country,
      flatrate: flatrate ?? this.flatrate,
      rent: rent ?? this.rent,
      buy: buy ?? this.buy,
    );
  }
}

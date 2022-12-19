import 'package:lib_dependencies/lib_dependencies.dart';

class WatchBuy extends Equatable {
  final int displayPriority;
  final String logoPath;
  final int providerId;
  final String providerName;

  const WatchBuy({
    required this.displayPriority,
    required this.logoPath,
    required this.providerId,
    required this.providerName,
  });

  @override
  List<Object?> get props => [
        displayPriority,
        logoPath,
        providerId,
        providerName,
      ];

  WatchBuy copyWith({
    int? displayPriority,
    String? logoPath,
    int? providerId,
    String? providerName,
  }) {
    return WatchBuy(
      displayPriority: displayPriority ?? this.displayPriority,
      logoPath: logoPath ?? this.logoPath,
      providerId: providerId ?? this.providerId,
      providerName: providerName ?? this.providerName,
    );
  }
}

class CardModel {
  final String id;
  final String brand;
  final String last4;
  final int expMonth;
  final int expYear;
  final bool isDefault;

  CardModel({
    required this.id,
    required this.brand,
    required this.last4,
    required this.expMonth,
    required this.expYear,
    required this.isDefault,
  });

  factory CardModel.fromJson(Map<String, dynamic> json) {
    final card = json['card'] as Map<String, dynamic>? ?? {};
    return CardModel(
      id: json['id'] as String? ?? '',
      brand: card['brand'] as String? ?? 'unknown',
      last4: card['last4'] as String? ?? '0000',
      expMonth: card['exp_month'] as int? ?? 0,
      expYear: card['exp_year'] as int? ?? 0,
      isDefault: json['isDefault'] as bool? ?? false,
    );
  }
}

class CardListResponse {
  final List<CardModel> cards;
  final String? defaultPaymentMethodId;

  CardListResponse({required this.cards, this.defaultPaymentMethodId});

  factory CardListResponse.fromJson(Map<String, dynamic> json) {
    final rawCards = json['cards'] as List<dynamic>? ?? [];
    return CardListResponse(
      cards: rawCards
          .map((e) => CardModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      defaultPaymentMethodId:
          json['defaultPaymentMethodId'] as String?,
    );
  }
}

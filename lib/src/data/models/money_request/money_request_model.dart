class MoneyRequestUser {
  final String id;
  final String email;

  MoneyRequestUser({required this.id, required this.email});

  factory MoneyRequestUser.fromJson(Map<String, dynamic> json) {
    return MoneyRequestUser(
      id: json['_id'] as String? ?? '',
      email: json['email'] as String? ?? '',
    );
  }
}

class MoneyRequestModel {
  final String id;
  final MoneyRequestUser sender;
  final MoneyRequestUser receiver;
  final double amount;
  final String purpose;
  final String status;
  final DateTime createdAt;

  MoneyRequestModel({
    required this.id,
    required this.sender,
    required this.receiver,
    required this.amount,
    required this.purpose,
    required this.status,
    required this.createdAt,
  });

  factory MoneyRequestModel.fromJson(Map<String, dynamic> json) {
    return MoneyRequestModel(
      id: json['_id'] as String? ?? '',
      sender: MoneyRequestUser.fromJson(
        json['sender'] as Map<String, dynamic>? ?? {},
      ),
      receiver: MoneyRequestUser.fromJson(
        json['receiver'] as Map<String, dynamic>? ?? {},
      ),
      amount: (json['amount'] as num? ?? 0).toDouble(),
      purpose: json['purpose'] as String? ?? '',
      status: json['status'] as String? ?? 'Pending',
      createdAt:
          DateTime.tryParse(json['createdAt'] as String? ?? '') ??
          DateTime.now(),
    );
  }
}

class MoneyRequestListResponse {
  final List<MoneyRequestModel> requests;

  MoneyRequestListResponse({required this.requests});

  factory MoneyRequestListResponse.fromJson(Map<String, dynamic> json) {
    final raw = json['requests'] as List<dynamic>? ?? [];

    return MoneyRequestListResponse(
      requests: raw
          .map((e) => MoneyRequestModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

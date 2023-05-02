import 'dart:convert';

class NotchpayInitRequest {
  NotchpayInitRequest({
    required this.email,
    required this.currency,
    required this.amount,
    required this.phone,
    required this.description,
  });
  factory NotchpayInitRequest.fromJson(String source) =>
      NotchpayInitRequest.fromMap(json.decode(source) as Map<String, dynamic>);

  factory NotchpayInitRequest.fromMap(Map<String, dynamic> map) {
    return NotchpayInitRequest(
      email: (map['email'] ?? '') as String,
      currency: (map['currency'] ?? '') as String,
      amount: (map['amount'] ?? '') as String,
      phone: (map['phone'] ?? '') as String,
      description: (map['description'] ?? '') as String,
    );
  }
  final String email;
  final String currency;
  final String amount;
  final String phone;
  final String description;

  NotchpayInitRequest copyWith({
    String? email,
    String? currency,
    String? amount,
    String? phone,
    String? description,
  }) {
    return NotchpayInitRequest(
      email: email ?? this.email,
      currency: currency ?? this.currency,
      amount: amount ?? this.amount,
      phone: phone ?? this.phone,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'currency': currency,
      'amount': amount,
      'phone': phone,
      'description': description,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    // ignore: lines_longer_than_80_chars
    return 'NotchpayInitRequest(email: $email, currency: $currency, amount: $amount, phone: $phone, description: $description)';
  }

  @override
  bool operator ==(covariant NotchpayInitRequest other) {
    if (identical(this, other)) return true;

    return other.email == email &&
        other.currency == currency &&
        other.amount == amount &&
        other.phone == phone &&
        other.description == description;
  }

  @override
  int get hashCode {
    return email.hashCode ^
        currency.hashCode ^
        amount.hashCode ^
        phone.hashCode ^
        description.hashCode;
  }
}

// ignore_for_file: non_constant_identifier_names, avoid_dynamic_calls

import 'dart:convert';

class NotchPayInitResponse {
  NotchPayInitResponse({
    required this.status,
    required this.message,
    required this.code,
    required this.transaction,
    required this.authorization_url,
  });
  factory NotchPayInitResponse.fromJson(String source) =>
      NotchPayInitResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  factory NotchPayInitResponse.fromMap(Map<String, dynamic> map) {
    return NotchPayInitResponse(
      status: (map['status'] ?? '') as String,
      message: (map['message'] ?? '') as String,
      code: (map['code'] ?? 0) as int,
      transaction:
          Transaction.fromMap(map['transaction'] as Map<String, dynamic>),
      authorization_url: (map['authorization_url'] ?? '') as String,
    );
  }
  final String status;
  final String message;
  final int code;
  final Transaction transaction;
  final String authorization_url;

  NotchPayInitResponse copyWith({
    String? status,
    String? message,
    int? code,
    Transaction? transaction,
    String? authorization_url,
  }) {
    return NotchPayInitResponse(
      status: status ?? this.status,
      message: message ?? this.message,
      code: code ?? this.code,
      transaction: transaction ?? this.transaction,
      authorization_url: authorization_url ?? this.authorization_url,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status,
      'message': message,
      'code': code,
      'transaction': transaction.toMap(),
      'authorization_url': authorization_url,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    // ignore: lines_longer_than_80_chars
    return 'NotchPayInitResponse(status: $status, message: $message, code: $code, transaction: $transaction, authorization_url: $authorization_url)';
  }

  @override
  bool operator ==(covariant NotchPayInitResponse other) {
    if (identical(this, other)) return true;

    return other.status == status &&
        other.message == message &&
        other.code == code &&
        other.transaction == transaction &&
        other.authorization_url == authorization_url;
  }

  @override
  int get hashCode {
    return status.hashCode ^
        message.hashCode ^
        code.hashCode ^
        transaction.hashCode ^
        authorization_url.hashCode;
  }
}

class Transaction {
  Transaction({
    required this.amount,
    required this.amount_total,
    required this.sandbox,
    required this.fee,
    required this.converted_amount,
    required this.business,
    required this.customer,
    required this.description,
    required this.reference,
    required this.status,
    required this.currency,
    required this.initiated_at,
    required this.updated_at,
  });
  factory Transaction.fromJson(String source) =>
      Transaction.fromMap(json.decode(source) as Map<String, dynamic>);

  factory Transaction.fromMap(Map<String, dynamic> map) {
    return Transaction(
      amount: (map['amount'].toInt() ?? 0) as int,
      amount_total: (map['amount_total'].toInt() ?? 0) as int,
      sandbox: (map['sandbox'] ?? false) as bool,
      fee: (map['fee'].toInt() ?? 0) as int,
      converted_amount: (map['converted_amount'].toInt() ?? 0) as int,
      business: Business.fromMap(map['business'] as Map<String, dynamic>),
      customer: Customer.fromMap(map['customer'] as Map<String, dynamic>),
      description: (map['description'] ?? '') as String,
      reference: (map['reference'] ?? '') as String,
      status: (map['status'] ?? '') as String,
      currency: (map['currency'] ?? '') as String,
      initiated_at: (map['initiated_at'] ?? '') as String,
      updated_at: (map['updated_at'] ?? '') as String,
    );
  }
  final int amount;
  final int amount_total;
  final bool sandbox;
  final int fee;
  final int converted_amount;
  final Business business;
  final Customer customer;
  final String description;
  final String reference;
  final String status;
  final String currency;
  final String initiated_at;
  final String updated_at;

  Transaction copyWith({
    int? amount,
    int? amount_total,
    bool? sandbox,
    int? fee,
    int? converted_amount,
    Business? business,
    Customer? customer,
    String? description,
    String? reference,
    String? status,
    String? currency,
    String? initiated_at,
    String? updated_at,
  }) {
    return Transaction(
      amount: amount ?? this.amount,
      amount_total: amount_total ?? this.amount_total,
      sandbox: sandbox ?? this.sandbox,
      fee: fee ?? this.fee,
      converted_amount: converted_amount ?? this.converted_amount,
      business: business ?? this.business,
      customer: customer ?? this.customer,
      description: description ?? this.description,
      reference: reference ?? this.reference,
      status: status ?? this.status,
      currency: currency ?? this.currency,
      initiated_at: initiated_at ?? this.initiated_at,
      updated_at: updated_at ?? this.updated_at,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'amount': amount,
      'amount_total': amount_total,
      'sandbox': sandbox,
      'fee': fee,
      'converted_amount': converted_amount,
      'business': business.toMap(),
      'customer': customer.toMap(),
      'description': description,
      'reference': reference,
      'status': status,
      'currency': currency,
      'initiated_at': initiated_at,
      'updated_at': updated_at,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'Transaction(amount: $amount, amount_total: $amount_total, sandbox: $sandbox, fee: $fee, converted_amount: $converted_amount, business: $business, customer: $customer, description: $description, reference: $reference, status: $status, currency: $currency, initiated_at: $initiated_at, updated_at: $updated_at)';
  }

  @override
  bool operator ==(covariant Transaction other) {
    if (identical(this, other)) return true;

    return other.amount == amount &&
        other.amount_total == amount_total &&
        other.sandbox == sandbox &&
        other.fee == fee &&
        other.converted_amount == converted_amount &&
        other.business == business &&
        other.customer == customer &&
        other.description == description &&
        other.reference == reference &&
        other.status == status &&
        other.currency == currency &&
        other.initiated_at == initiated_at &&
        other.updated_at == updated_at;
  }

  @override
  int get hashCode {
    return amount.hashCode ^
        amount_total.hashCode ^
        sandbox.hashCode ^
        fee.hashCode ^
        converted_amount.hashCode ^
        business.hashCode ^
        customer.hashCode ^
        description.hashCode ^
        reference.hashCode ^
        status.hashCode ^
        currency.hashCode ^
        initiated_at.hashCode ^
        updated_at.hashCode;
  }
}

class Business {
  Business({
    required this.id,
    required this.country,
    required this.email,
    required this.phone,
    required this.poster,
    required this.name,
  });
  factory Business.fromJson(String source) =>
      Business.fromMap(json.decode(source) as Map<String, dynamic>);

  factory Business.fromMap(Map<String, dynamic> map) {
    return Business(
      id: (map['id'] ?? '') as String,
      country: (map['country'] ?? '') as String,
      email: (map['email'] ?? '') as String,
      phone: (map['phone'] ?? '') as String,
      poster: (map['poster'] ?? '') as String,
      name: (map['name'] ?? '') as String,
    );
  }
  final String id;
  final String country;
  final String email;
  final String phone;
  final String poster;
  final String name;

  Business copyWith({
    String? id,
    String? country,
    String? email,
    String? phone,
    String? poster,
    String? name,
  }) {
    return Business(
      id: id ?? this.id,
      country: country ?? this.country,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      poster: poster ?? this.poster,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'country': country,
      'email': email,
      'phone': phone,
      'poster': poster,
      'name': name,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'Business(id: $id, country: $country, email: $email, phone: $phone, poster: $poster, name: $name)';
  }

  @override
  bool operator ==(covariant Business other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.country == country &&
        other.email == email &&
        other.phone == phone &&
        other.poster == poster &&
        other.name == name;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        country.hashCode ^
        email.hashCode ^
        phone.hashCode ^
        poster.hashCode ^
        name.hashCode;
  }
}

class Customer {
  Customer({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
  });
  factory Customer.fromJson(String source) =>
      Customer.fromMap(json.decode(source) as Map<String, dynamic>);

  factory Customer.fromMap(Map<String, dynamic> map) {
    return Customer(
      id: (map['id'] ?? '') as String,
      name: (map['name'] ?? '') as String,
      email: (map['email'] ?? '') as String,
      phone: (map['phone'] ?? '') as String,
    );
  }
  final String id;
  final String name;
  final String email;
  final String phone;

  Customer copyWith({
    String? id,
    String? name,
    String? email,
    String? phone,
  }) {
    return Customer(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'Customer(id: $id, name: $name, email: $email, phone: $phone)';
  }
}

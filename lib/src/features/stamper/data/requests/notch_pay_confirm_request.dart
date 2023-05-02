import 'dart:convert';

class NotchpayConfirmRequest {
  NotchpayConfirmRequest({
    required this.channel,
    required this.data,
  });
  factory NotchpayConfirmRequest.fromJson(String source) =>
      NotchpayConfirmRequest.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  factory NotchpayConfirmRequest.fromMap(Map<String, dynamic> map) {
    return NotchpayConfirmRequest(
      channel: (map['channel'] ?? '') as String,
      data: Data.fromMap(map['data'] as Map<String, dynamic>),
    );
  }
  final String channel;
  final Data data;

  NotchpayConfirmRequest copyWith({
    String? channel,
    Data? data,
  }) {
    return NotchpayConfirmRequest(
      channel: channel ?? this.channel,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'channel': channel,
      'data': data.toMap(),
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() => 'NotchpayConfirmRequest(channel: $channel, data: $data)';

  @override
  bool operator ==(covariant NotchpayConfirmRequest other) {
    if (identical(this, other)) return true;

    return other.channel == channel && other.data == data;
  }

  @override
  int get hashCode => channel.hashCode ^ data.hashCode;
}

class Data {
  Data({
    required this.phone,
  });
  factory Data.fromJson(String source) =>
      Data.fromMap(json.decode(source) as Map<String, dynamic>);

  factory Data.fromMap(Map<String, dynamic> map) {
    return Data(
      phone: (map['phone'] ?? '') as String,
    );
  }
  final String phone;

  Data copyWith({
    String? phone,
  }) {
    return Data(
      phone: phone ?? this.phone,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'phone': phone,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() => 'Data(phone: $phone)';

  @override
  bool operator ==(covariant Data other) {
    if (identical(this, other)) return true;

    return other.phone == phone;
  }

  @override
  int get hashCode => phone.hashCode;
}

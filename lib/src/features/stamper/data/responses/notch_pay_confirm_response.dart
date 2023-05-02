import 'dart:convert';

class NotchPayConfirmResponse {
  NotchPayConfirmResponse({
    required this.message,
    required this.code,
    required this.status,
    required this.action,
  });
  factory NotchPayConfirmResponse.fromJson(String source) =>
      NotchPayConfirmResponse.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  factory NotchPayConfirmResponse.fromMap(Map<String, dynamic> map) {
    return NotchPayConfirmResponse(
      message: (map['message'] ?? '') as String,
      code: (map['code'] ?? 0) as int,
      status: (map['status'] ?? '') as String,
      action: (map['action'] ?? '') as String,
    );
  }
  final String message;
  final int code;
  final String status;
  final String action;

  NotchPayConfirmResponse copyWith({
    String? message,
    int? code,
    String? status,
    String? action,
  }) {
    return NotchPayConfirmResponse(
      message: message ?? this.message,
      code: code ?? this.code,
      status: status ?? this.status,
      action: action ?? this.action,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'message': message,
      'code': code,
      'status': status,
      'action': action,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    // ignore: lines_longer_than_80_chars
    return 'NotchPayConfirmResponse(message: $message, code: $code, status: $status, action: $action)';
  }

  @override
  bool operator ==(covariant NotchPayConfirmResponse other) {
    if (identical(this, other)) return true;

    return other.message == message &&
        other.code == code &&
        other.status == status &&
        other.action == action;
  }

  @override
  int get hashCode {
    return message.hashCode ^ code.hashCode ^ status.hashCode ^ action.hashCode;
  }
}

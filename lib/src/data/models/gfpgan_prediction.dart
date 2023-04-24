// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class GfpganPrediction {
  GfpganPrediction({
    required this.error,
    required this.input,
    required this.status,
    required this.version,
    required this.output,
    required this.metrics,
    required this.logs,
    required this.id,
    required this.createdAt,
    required this.startedAt,
    required this.completedAt,
  });
  final String error;
  final String input;
  final String status;
  final String version;
  final String output;
  final String metrics;
  final String logs;
  final String id;
  final String createdAt;
  final String startedAt;
  final String completedAt;

  GfpganPrediction copyWith({
    String? error,
    String? input,
    String? status,
    String? version,
    String? output,
    String? metrics,
    String? logs,
    String? id,
    String? createdAt,
    String? startedAt,
    String? completedAt,
  }) {
    return GfpganPrediction(
      error: error ?? this.error,
      input: input ?? this.input,
      status: status ?? this.status,
      version: version ?? this.version,
      output: output ?? this.output,
      metrics: metrics ?? this.metrics,
      logs: logs ?? this.logs,
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      startedAt: startedAt ?? this.startedAt,
      completedAt: completedAt ?? this.completedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'error': error,
      'input': input,
      'status': status,
      'version': version,
      'output': output,
      'metrics': metrics,
      'logs': logs,
      'id': id,
      'createdAt': createdAt,
      'startedAt': startedAt,
      'completedAt': completedAt,
    };
  }

  factory GfpganPrediction.fromMap(Map<String, dynamic> map) {
    return GfpganPrediction(
      error: (map['error'] ?? '') as String,
      input: (map['input'] ?? '') as String,
      status: (map['status'] ?? '') as String,
      version: (map['version'] ?? '') as String,
      output: (map['output'] ?? '') as String,
      metrics: (map['metrics'] ?? '') as String,
      logs: (map['logs'] ?? '') as String,
      id: (map['id'] ?? '') as String,
      createdAt: (map['createdAt'] ?? '') as String,
      startedAt: (map['startedAt'] ?? '') as String,
      completedAt: (map['completedAt'] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory GfpganPrediction.fromJson(String source) =>
      GfpganPrediction.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'GfpganPrediction(error: $error, input: $input, status: $status, version: $version, output: $output, metrics: $metrics, logs: $logs, id: $id, createdAt: $createdAt, startedAt: $startedAt, completedAt: $completedAt)';
  }

  @override
  bool operator ==(covariant GfpganPrediction other) {
    if (identical(this, other)) return true;

    return other.error == error &&
        other.input == input &&
        other.status == status &&
        other.version == version &&
        other.output == output &&
        other.metrics == metrics &&
        other.logs == logs &&
        other.id == id &&
        other.createdAt == createdAt &&
        other.startedAt == startedAt &&
        other.completedAt == completedAt;
  }

  @override
  int get hashCode {
    return error.hashCode ^
        input.hashCode ^
        status.hashCode ^
        version.hashCode ^
        output.hashCode ^
        metrics.hashCode ^
        logs.hashCode ^
        id.hashCode ^
        createdAt.hashCode ^
        startedAt.hashCode ^
        completedAt.hashCode;
  }
}

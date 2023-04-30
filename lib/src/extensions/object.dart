import 'dart:developer' as developer;

extension ObjectX on Object {
  void log() => developer.log(toString());
}

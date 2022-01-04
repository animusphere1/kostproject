import 'package:flutter/foundation.dart';

void debug(dynamic value) {
  if (kDebugMode) {
    print('debug : $value');
  }
}

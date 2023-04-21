import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class QrCodeDataSource {
  static const channel = MethodChannel('barcode_scanner');

  Future<String?> scan() async {
    if (defaultTargetPlatform != TargetPlatform.android) {
      return null;
    }

    return channel.invokeMethod<String>('scan');
  }
}
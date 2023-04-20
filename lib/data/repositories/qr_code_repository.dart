import 'package:flutter/services.dart';

class QrCodeRepository {
  static const channel = MethodChannel('barcode_scanner');

  Future<String?> scan() async {
    return channel.invokeMethod<String>('scan');
  }
}
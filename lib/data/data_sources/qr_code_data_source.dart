import 'package:flutter/services.dart';

class QrCodeDataSource {
  static const channel = MethodChannel('barcode_scanner');

  Future<String?> scan() async => channel.invokeMethod<String>('scan');
}
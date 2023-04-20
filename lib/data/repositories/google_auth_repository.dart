import '../data_sources/qr_code_data_source.dart';

class GoogleAuthRepository {
  GoogleAuthRepository(this.qrCodeDataSource);

  final QrCodeDataSource qrCodeDataSource;

  Future<String?> import() async {
    final qrCodeContent = await qrCodeDataSource.scan();


  }
}
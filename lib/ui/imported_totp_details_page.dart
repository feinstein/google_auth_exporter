import 'package:flutter/material.dart';
import 'package:google_auth_exporter/data/models/google_auth_totp.dart';
import 'package:google_auth_exporter/data/repositories/qr_code_repository.dart';
import 'package:google_auth_exporter/di.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:screen_brightness/screen_brightness.dart';

import '../main.dart';

class ImportedTotpDetailsPage extends StatefulWidget {
  const ImportedTotpDetailsPage({
    super.key,
    required this.totp,
  });

  final GoogleAuthTotp totp;

  @override
  State<ImportedTotpDetailsPage> createState() => _ImportedTotpDetailsPageState();
}

class _ImportedTotpDetailsPageState extends State<ImportedTotpDetailsPage> with RouteAware {
  late final qrCodeData = getIt<QrCodeRepository>().qrCodeDataFor(
    label: widget.totp.label,
    issuer: widget.totp.issuer,
    secret: widget.totp.secret,
  );

  @override
  void didPush() => ScreenBrightness().setScreenBrightness(1.0);

  @override
  void didPopNext() => ScreenBrightness().setScreenBrightness(1.0);

  @override
  void didPop() => ScreenBrightness().resetScreenBrightness();

  @override
  void didPushNext() => ScreenBrightness().resetScreenBrightness();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.light(useMaterial3: true),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: Text(widget.totp.issuer),
            ),
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      widget.totp.name,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: 32.0),
                    QrImage(data: qrCodeData),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}

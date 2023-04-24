import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_auth_exporter/ui/imported_totps_page.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../data/repositories/google_auth_repository.dart';
import '../di.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<void> showMessageDialog(String title, String message) async {
    if (!mounted) {
      return;
    }

    return showDialog(context: context, builder: (context) {
      return AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Ok'))
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Authenticator Exporter'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            RichText(
              text: TextSpan(
                style: Theme.of(context).textTheme.bodyMedium,
                children: [
                  const TextSpan(text: 'This app is meant to securely import your verification codes from Google Authenticator, so you can export them to any other app you want.\n\n'),
                  const TextSpan(text: "Google Authenticator generates a proprietary QR Code for exporting your 2FA to another device. It blocks screenshots, so you can't "
                      "use this app for scanning the Google Authenticator QR code in the same device.\n\n"),
                  const TextSpan(text: 'You can take a picture of the QR code with another device (computer, phone, etc.), then scan the picture with this app.\n\n'),
                  const TextSpan(text: "This app doesn't store or transmit any data to the internet and is open-sourced. You can find the code "),
                  TextSpan(
                    text: 'here.',
                    style: const TextStyle(color: Colors.blue, decoration: TextDecoration.underline),
                    recognizer: TapGestureRecognizer()..onTap = () => launchUrlString('https://github.com/feinstein/google_auth_exporter', mode: LaunchMode.externalApplication),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40.0),
            ElevatedButton(
              onPressed: () async {
                try {
                  final totps = await getIt<GoogleAuthRepository>().import();
                  if (totps == null || !mounted) {
                    // The user canceled the import
                    return;
                  }

                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ImportedTotpPage(totps: totps),
                    ),
                  );
                } on InvalidQrCodeException {
                  await showMessageDialog('Invalid QR Code', 'This QR Code is not from Google Authenticator.');
                }
              },
              child: const Text('Scan QR Code'),
            ),
          ],
        ),
      ),
    );
  }
}

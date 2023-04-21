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
        title: const Text('Google Auth Exporter'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            RichText(
              text: TextSpan(
                children: [
                  const TextSpan(text: 'Google Authenticator generates a proprietary QR Code for exporting your 2FA to another device.\n\n'),
                  const TextSpan(text: 'If you want to use this app from the same device that has Google Authenticator, '
                      'take a picture of the QR code with another device (computer, phone, etc.), then scan the picture with this app.\n\n'),
                  const TextSpan(text: "This app doesn't transmit any data to the internet and is open-sourced. The algorithm was inspired by "),
                  TextSpan(
                    text: 'this node.js package.',
                    style: const TextStyle(color: Colors.blue, decoration: TextDecoration.underline),
                    recognizer: TapGestureRecognizer()..onTap = () => launchUrlString('https://github.com/krissrex/google-authenticator-exporter', mode: LaunchMode.externalApplication),
                  ),
                ],
                style: Theme.of(context).textTheme.titleMedium,
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

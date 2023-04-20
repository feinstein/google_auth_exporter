import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_auth_exporter/data/repositories/qr_code_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        brightness: Brightness.dark,
        canvasColor: const Color(0xFF202124),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.white,
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
            ),
            elevation: 0,

        )
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
            Text(
              'Google Authenticator generates a proprietary QR Code for exporting your 2FA to another device.\n\n'
              "For security reasons, it's not possible to use the same device for scanning the QR code.\n\n"
              'If you want to use this app from the same device that has Google Authenticator, take a picture '
              'of the QR code with another device (computer, phone, etc.) '
              'and then scan the picture with this app.\n\n'
              "This app doesn't transmit any data to the internet and is open-sourced.",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 40.0),
            ElevatedButton(
              onPressed: () async {
                final qrCode = await QrCodeRepository().scan();
              },
              child: const Text('Scan QR Code'),
            ),
          ],
        ),
      ),
    );
  }
}

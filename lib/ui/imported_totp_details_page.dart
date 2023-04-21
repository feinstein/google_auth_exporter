import 'package:flutter/material.dart';
import 'package:google_auth_exporter/data/models/google_auth_totp.dart';

class ImportedTotpDetailsPage extends StatelessWidget {
  const ImportedTotpDetailsPage({
    super.key,
    required this.totp,
  });

  final GoogleAuthTotp totp;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(totp.issuer),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(totp.name),
              const SizedBox(height: 32.0),
              Placeholder(),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

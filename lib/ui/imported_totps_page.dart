import 'package:flutter/material.dart';
import 'package:google_auth_exporter/ui/imported_totp_details_page.dart';

import '../data/models/google_auth_totp.dart';

class ImportedTotpPage extends StatelessWidget {
  const ImportedTotpPage({
    super.key,
    required this.totps,
  });

  final List<GoogleAuthTotp> totps;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Imported Codes'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final totp = totps[index];
          return TotpItem(totp: totp);
        },
        itemCount: totps.length,
      ),
    );
  }
}

class TotpItem extends StatelessWidget {
  const TotpItem({
    super.key,
    required this.totp,
  });

  final GoogleAuthTotp totp;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ImportedTotpDetailsPage(totp: totp),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      totp.issuer,
                      style: Theme.of(context).textTheme.titleMedium,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      totp.name,
                      style: Theme.of(context).textTheme.titleSmall,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 16.0),
                  ],
                ),
                const Icon(Icons.keyboard_arrow_right),
              ],
            ),
            const Divider(color: Colors.white38, height: 0.0),
          ],
        ),
      ),
    );
  }
}

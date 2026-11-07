import 'dart:async';

import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:pandoo/l10n/l10n.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key, this.versionOverride});

  /// Test hook: skips the platform plugin and shows this version string.
  final String? versionOverride;

  static const String sourceUrl = 'https://github.com/teamsuperpanda/pandoo';

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  String? _version;

  @override
  void initState() {
    super.initState();
    final override = widget.versionOverride;
    if (override != null) {
      _version = override;
    } else {
      unawaited(
        PackageInfo.fromPlatform().then((info) {
          if (!mounted) return;
          setState(() {
            _version = '${info.version} (${info.buildNumber})';
          });
        }),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;
    final version = _version;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.about)),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            Center(
              child: Image.asset(
                'assets/images/icon/icon.png',
                height: 88,
                semanticLabel: l10n.appTitle,
              ),
            ),
            const SizedBox(height: 16),
            Semantics(
              header: true,
              child: Text(
                l10n.appTitle,
                textAlign: TextAlign.center,
                style: theme.textTheme.headlineSmall,
              ),
            ),
            const SizedBox(height: 8),
            if (version != null)
              Text(
                l10n.versionLabel(version),
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyMedium,
              ),
            const SizedBox(height: 4),
            Text(
              l10n.builtBy,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium,
            ),
            const SizedBox(height: 24),
            Semantics(
              header: true,
              child: Text(l10n.privacy, style: theme.textTheme.titleMedium),
            ),
            const SizedBox(height: 8),
            Text(l10n.privacyStatement, style: theme.textTheme.bodyMedium),
            const SizedBox(height: 24),
            ListTile(
              leading: const Icon(Icons.article_outlined),
              title: Text(l10n.thirdPartyLicenses),
              subtitle: Text(l10n.mitLicense),
              onTap: () => showLicensePage(
                context: context,
                applicationName: l10n.appTitle,
                applicationVersion: version,
              ),
            ),
            ListTile(
              leading: const Icon(Icons.code),
              title: Text(l10n.sourceCode),
              subtitle: const SelectableText(AboutScreen.sourceUrl),
            ),
            ListTile(
              leading: const Icon(Icons.description_outlined),
              title: Text(l10n.license),
              subtitle: Text(l10n.mitLicense),
            ),
          ],
        ),
      ),
    );
  }
}

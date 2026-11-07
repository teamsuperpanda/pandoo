import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pandoo/l10n/l10n.dart';

class StartupErrorScreen extends StatefulWidget {
  const StartupErrorScreen({
    required this.diagnostics,
    required this.onRetry,
    required this.onReset,
    super.key,
  });

  final String diagnostics;

  /// Returns the new diagnostics on failure, or null when startup succeeded.
  final Future<String?> Function() onRetry;

  /// Deletes local data and restarts. Only called after confirmation.
  final Future<void> Function() onReset;

  @override
  State<StartupErrorScreen> createState() => _StartupErrorScreenState();
}

class _StartupErrorScreenState extends State<StartupErrorScreen> {
  late String _diagnostics = widget.diagnostics;
  bool _busy = false;

  Future<void> _retry() async {
    if (_busy) return;
    setState(() => _busy = true);
    final error = await widget.onRetry();
    if (!mounted) return;
    setState(() {
      _busy = false;
      if (error != null) _diagnostics = error;
    });
  }

  Future<void> _copyDiagnostics() async {
    await Clipboard.setData(ClipboardData(text: _diagnostics));
    if (!mounted) return;
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(context.l10n.diagnosticsCopied)));
  }

  Future<void> _confirmReset() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(context.l10n.resetConfirmTitle),
        content: Text(context.l10n.resetConfirmMessage),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(context.l10n.cancel),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text(context.l10n.resetLocalData),
          ),
        ],
      ),
    );
    if (confirmed != true) return;
    setState(() => _busy = true);
    await widget.onReset();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Icon(
                  Icons.storage_outlined,
                  size: 48,
                  color: theme.colorScheme.error,
                ),
                const SizedBox(height: 16),
                Semantics(
                  header: true,
                  child: Text(
                    context.l10n.startupErrorTitle,
                    textAlign: TextAlign.center,
                    style: theme.textTheme.headlineSmall,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  context.l10n.startupErrorMessage,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyMedium,
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.surfaceContainerHighest,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: SelectableText(
                    _diagnostics,
                    style: theme.textTheme.bodySmall,
                  ),
                ),
                const SizedBox(height: 24),
                FilledButton(
                  onPressed: _busy ? null : _retry,
                  child: Text(context.l10n.retry),
                ),
                const SizedBox(height: 8),
                OutlinedButton(
                  onPressed: _busy ? null : _copyDiagnostics,
                  child: Text(context.l10n.copyDiagnostics),
                ),
                const SizedBox(height: 8),
                TextButton(
                  onPressed: _busy ? null : _confirmReset,
                  child: Text(
                    context.l10n.resetLocalData,
                    style: TextStyle(color: theme.colorScheme.error),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

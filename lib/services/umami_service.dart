import 'dart:async';
import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class UmamiService {
  UmamiService({
    required this.websiteId,
    required this.endpoint,
  });

  final String websiteId;
  final String endpoint;
  final http.Client _client = http.Client();
  bool _disposed = false;
  bool enabled = true;

  void trackPageView({required String url, String? title, Map<String, String>? data}) {
    if (_disposed || !enabled) return;
    _send('event', {
      'url': url,
      'event_name': 'pageview',
      if (title != null) 'title': title,
      if (data != null) ...data,
    });
  }

  void trackEvent({required String eventName, Map<String, dynamic>? data}) {
    if (_disposed || !enabled) return;
    _send('event', {
      'event_name': eventName,
      if (data != null) ...data,
    });
  }

  void _send(String type, Map<String, dynamic> payload) {
    if (_disposed) return;
    try {
      unawaited(_client
          .post(
            Uri.parse(endpoint),
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode({
              'type': type,
              'payload': {
                'website': websiteId,
                ...payload,
              },
            }),
          )
          .timeout(const Duration(seconds: 10))
          .then((_) => null)
          .catchError((Object e) {
            debugPrint('UmamiService: send failed: $e');
            return null;
          }));
    } on Object catch (_) {}
  }

  void dispose() {
    _disposed = true;
    _client.close();
  }
}

class AnalyticsEvent {
  AnalyticsEvent._();
  static const String itemAdd = 'item_add';
  static const String cleanupDialog = 'cleanup_dialog';
  static const String settingsOpen = 'settings_open';
  static const String themeToggle = 'theme_toggle';
  static const String languageChange = 'language_change';
  static const String listRename = 'list_rename';
  static const String itemToggle = 'item_toggle';
  static const String appLaunch = 'app_launch';
  static const String cleanupComplete = 'cleanup_complete';
  static const String listOpen = 'list_open';
  static const String listCreate = 'list_create';
  static const String listDelete = 'list_delete';
  static const String listPin = 'list_pin';
  static const String listUnpin = 'list_unpin';
}

class UmamiNavigatorObserver extends NavigatorObserver {
  UmamiNavigatorObserver(this.umamiService);

  final UmamiService umamiService;

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    final name = route.settings.name;
    if (name != null) {
      umamiService.trackPageView(url: name, title: name);
    }
  }
}

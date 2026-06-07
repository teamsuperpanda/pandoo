class AppConfig {
  AppConfig._();

  static const String analyticsWebsiteId = String.fromEnvironment(
    'ANALYTICS_WEBSITE_ID',
  );

  static const String analyticsEndpoint = String.fromEnvironment(
    'ANALYTICS_ENDPOINT',
  );
}

import 'package:flutter/material.dart';
import 'package:pandoo/l10n/app_localizations.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'services/storage_service.dart';
import 'core/theme/app_theme.dart';
import 'dialog/settings.dart';
import 'widgets/lists/show_lists.dart';
import 'widgets/lists/add_list.dart';
import 'l10n/l10n.dart';
import 'services/settings_service.dart';

void main() async {
  await Hive.initFlutter();
  await StorageService().init();
  await SettingsService().init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late ThemeMode _themeMode;
  late Locale? _locale;
  final _settings = SettingsService();

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  void _loadSettings() {
    setState(() {
      _themeMode = _settings.getThemeMode();
      _locale = _settings.getLocale();
    });
  }

  void _handleThemeChange(ThemeMode themeMode) async {
    await _settings.setThemeMode(themeMode);
    setState(() {
      _themeMode = themeMode;
    });
  }

  void _handleLanguageChange(Locale? locale) async {
    await _settings.setLocale(locale);
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pandoo',
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: _themeMode,
      locale: _locale,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: MyHomePage(
        onThemeChanged: _handleThemeChange,
        currentThemeMode: _themeMode,
        onLanguageChanged: _handleLanguageChange,
        currentLocale: _locale,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final Function(ThemeMode) onThemeChanged;
  final ThemeMode currentThemeMode;
  final Function(Locale?) onLanguageChanged;
  final Locale? currentLocale;

  const MyHomePage({
    super.key,
    required this.onThemeChanged,
    required this.currentThemeMode,
    required this.onLanguageChanged,
    required this.currentLocale,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _openSettings(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => SettingsDialog(
        onThemeChanged: widget.onThemeChanged,
        currentThemeMode: widget.currentThemeMode,
        onLanguageChanged: widget.onLanguageChanged,
        currentLocale: widget.currentLocale,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        foregroundColor: Theme.of(context).appBarTheme.foregroundColor,
        elevation: Theme.of(context).appBarTheme.elevation,
        centerTitle: Theme.of(context).appBarTheme.centerTitle,
        title: Text(
          context.l10n.appTitle,
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
        leading: RotationTransition(
          turns: _animation,
          child: IconButton(
            icon: Image.asset(
              'assets/images/icon/icon.png',
              height: 36,
            ),
            onPressed: () {
              _animationController.forward(from: 0);
            },
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Theme.of(context).appBarTheme.foregroundColor,
            ),
            onPressed: () => _openSettings(context),
            padding: const EdgeInsets.only(right: 16.0),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                color: Theme.of(context).scaffoldBackgroundColor,
                child: const ShowLists(),
              ),
            ),
            AddList(
              onListAdded: () {
                // No need for refresh - ValueListenableBuilder handles updates
              },
            ),
          ],
        ),
      ),
    );
  }
}

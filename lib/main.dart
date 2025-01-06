import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'services/storage_service.dart';
import 'core/theme/app_theme.dart';
import 'dialog/settings.dart';
import 'widgets/lists/show_lists.dart';
import 'widgets/lists/add_list.dart';

void main() async {
  await Hive.initFlutter();
  await StorageService().init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.system;

  void _handleThemeChange(ThemeMode themeMode) {
    setState(() {
      _themeMode = themeMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pandoo',
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: _themeMode,
      home: MyHomePage(onThemeChanged: _handleThemeChange),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final Function(ThemeMode) onThemeChanged;

  const MyHomePage({
    super.key,
    required this.onThemeChanged,
  });

  void _openSettings(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => SettingsDialog(
        onThemeChanged: onThemeChanged,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 60,
            color: Theme.of(context).appBarTheme.backgroundColor,
            child: Stack(
              children: [
                Positioned(
                  left: 16,
                  top: 0,
                  bottom: 0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Image.asset(
                      'assets/images/icon/icon.png',
                      height: 36,
                    ),
                  ),
                ),
                const Center(
                  child: Text(
                    'Pandoo',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Positioned(
                  right: 4,
                  top: 0,
                  bottom: 0,
                  child: IconButton(
                    icon: const Icon(
                      Icons.settings,
                      color: Colors.white,
                    ),
                    onPressed: () => _openSettings(context),
                  ),
                ),
              ],
            ),
          ),
          const Expanded(
            child: ShowLists(),
          ),
          AddList(
            onListAdded: () {
              // No need for refresh - ValueListenableBuilder handles updates
            },
          ),
        ],
      ),
    );
  }
}

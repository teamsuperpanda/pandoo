import 'dart:async';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:pandoo/dialog/new_list_dialog.dart';
import 'package:pandoo/dialog/settings.dart';
import 'package:pandoo/l10n/l10n.dart';
import 'package:pandoo/services/settings_service.dart';
import 'package:pandoo/services/storage_service.dart';
import 'package:pandoo/services/umami_service.dart';
import 'package:pandoo/widgets/lists/show_lists.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    required this.onThemeChanged,
    required this.currentThemeMode,
    required this.onLanguageChanged,
    required this.currentLocale,
    required this.umamiService,
    this.onAnalyticsChanged,
    super.key,
  });

  final void Function(ThemeMode) onThemeChanged;
  final ThemeMode currentThemeMode;
  final void Function(Locale?) onLanguageChanged;
  final Locale? currentLocale;
  final UmamiService umamiService;
  final void Function(bool)? onAnalyticsChanged;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  late AnimationController _fabController;
  late Animation<double> _fabAnimation;
  bool _isRotatingForward = true;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController);
    _fabController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    _fabAnimation = Tween<double>(begin: -0.05, end: 0.05).animate(
      CurvedAnimation(parent: _fabController, curve: Curves.easeInOut),
    );
    SettingsService().notifier.addListener(_onSettingsChanged);
    widget.umamiService.trackPageView(url: '/', title: 'Home');
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted && SettingsService().getFabAnimation()) {
        unawaited(_fabController.repeat(reverse: true));
      }
    });
  }

  @override
  void dispose() {
    SettingsService().notifier.removeListener(_onSettingsChanged);
    _animationController.dispose();
    _fabController.dispose();
    super.dispose();
  }

  void _onSettingsChanged() {
    if (!mounted) return;
    if (SettingsService().getFabAnimation()) {
      if (!_fabController.isAnimating) {
        unawaited(_fabController.repeat(reverse: true));
      }
    } else {
      if (_fabController.isAnimating) {
        _fabController.stop();
      }
      _fabController.value = 0.5;
    }
  }

  void _openSettings(BuildContext context) {
    widget.umamiService.trackEvent(eventName: AnalyticsEvent.settingsOpen);
    showDialog<void>(
      context: context,
      builder: (context) => SettingsDialog(
        onThemeChanged: (mode) {
          widget.umamiService.trackEvent(
            eventName: AnalyticsEvent.themeToggle,
            data: {'theme': mode.name},
          );
          widget.onThemeChanged(mode);
        },
        currentThemeMode: widget.currentThemeMode,
        onLanguageChanged: (locale) {
          widget.umamiService.trackEvent(
            eventName: AnalyticsEvent.languageChange,
            data: {'locale': locale?.toString() ?? 'system'},
          );
          widget.onLanguageChanged(locale);
        },
        currentLocale: widget.currentLocale,
        analyticsEnabled: widget.umamiService.enabled,
        onAnalyticsChanged: widget.onAnalyticsChanged,
        fabAnimation: SettingsService().getFabAnimation(),
        onFabAnimationChanged: (value) {
          unawaited(SettingsService().setFabAnimation(value));
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.appBarTheme.backgroundColor,
        foregroundColor: theme.appBarTheme.foregroundColor,
        elevation: theme.appBarTheme.elevation,
        centerTitle: theme.appBarTheme.centerTitle,
        title: Semantics(
          header: true,
          child: Text(
            context.l10n.appTitle,
            style: theme.appBarTheme.titleTextStyle,
          ),
        ),
        leading: Semantics(
          button: true,
          label: '',
          child: RotationTransition(
            turns: _animation,
            child: IconButton(
              icon: Image.asset(
                'assets/images/icon/icon.png',
                height: 36,
              ),
              onPressed: () {
                if (_isRotatingForward) {
                  _animationController.forward(from: 0);
                } else {
                  _animationController.reverse(from: 1);
                }
                _isRotatingForward = !_isRotatingForward;
              },
            ),
          ),
        ),
        actions: [
          Semantics(
            button: true,
            label: context.l10n.settings,
            child: Padding(
              padding: const EdgeInsets.only(right: 8),
              child: IconButton(
                icon: Icon(
                  Icons.settings,
                  color: theme.appBarTheme.foregroundColor,
                ),
                tooltip: context.l10n.settings,
                onPressed: () => _openSettings(context),
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          SafeArea(
            child: ShowLists(
              umamiService: widget.umamiService,
            ),
          ),
          Positioned(
            right: 16,
            bottom: 16,
            child: AnimatedBuilder(
              animation: _fabAnimation,
              builder: (context, child) => Transform.rotate(
                angle: _fabAnimation.value,
                child: child,
              ),
              child: FloatingActionButton(
                onPressed: () async {
                  final l10n = context.l10n;
                  final messenger = ScaffoldMessenger.of(context);
                  final name = await showDialog<String>(
                    context: context,
                    builder: (_) => const NewListDialog(),
                  );
                  if (name == null || !mounted) return;
                  final success = await StorageService().addList(name);
                  if (!success) {
                    final snackBar = SnackBar(
                      elevation: 0,
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: Colors.transparent,
                      content: AwesomeSnackbarContent(
                        title: l10n.listExists,
                        message: l10n.listExistsMessage(name),
                        contentType: ContentType.failure,
                      ),
                    );
                    messenger
                      ..hideCurrentSnackBar()
                      ..showSnackBar(snackBar);
                    return;
                  }
                  widget.umamiService.trackEvent(
                    eventName: AnalyticsEvent.listCreate,
                    data: {'list': name},
                  );
                },
                child: const Icon(Icons.add),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

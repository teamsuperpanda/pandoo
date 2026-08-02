import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pandoo/dialog/list_name_dialog.dart';
import 'package:pandoo/dialog/settings.dart';
import 'package:pandoo/l10n/l10n.dart';
import 'package:pandoo/services/settings_service.dart';
import 'package:pandoo/services/storage_service.dart';
import 'package:pandoo/widgets/lists/show_lists.dart';
import 'package:pandoo/widgets/shared/app_snackbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
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
    unawaited(
      showDialog<void>(
        context: context,
        builder: (context) => const SettingsDialog(),
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
        leading: ExcludeSemantics(
          child: RotationTransition(
            turns: _animation,
            child: IconButton(
              icon: Image.asset(
                'assets/images/icon/icon.png',
                height: 36,
              ),
              onPressed: () {
                if (_isRotatingForward) {
                  unawaited(_animationController.forward(from: 0));
                } else {
                  unawaited(_animationController.reverse(from: 1));
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
      body: const SafeArea(child: ShowLists()),
      floatingActionButton: AnimatedBuilder(
        animation: _fabAnimation,
        builder: (context, child) => Transform.rotate(
          angle: _fabAnimation.value,
          child: child,
        ),
        child: FloatingActionButton(
          onPressed: () async {
            final l10n = context.l10n;
            final name = await showDialog<String>(
              context: context,
              builder: (ctx) => ListNameDialog(
                title: ctx.l10n.addNewList,
                buttonLabel: ctx.l10n.addNewList,
              ),
            );
            if (name == null || !mounted) return;
            final success = await StorageService().addList(name);
            if (!context.mounted) return;
            if (!success) {
              showErrorSnackBar(
                context,
                title: l10n.listExists,
                message: l10n.listExistsMessage(name),
              );
              return;
            }
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

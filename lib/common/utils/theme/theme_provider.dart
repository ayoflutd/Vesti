import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vesti/common/constant/storage_constant.dart';
import 'package:vesti/global.dart';


// Theme Mode StateNotifier
class ThemeModeNotifier extends StateNotifier<ThemeMode> {
  ThemeModeNotifier() : super(ThemeMode.system) {
    _loadThemeMode();
  }

  Future<void> _loadThemeMode() async {
    final themeModeString = Global.storageService.getString(AppStorage.THEME_MODE_KEY) ?? 'system'; // Default to light mode
    state = _themeModeFromString(themeModeString);
  }

  Future<void> setThemeMode(ThemeMode themeMode) async {
    await Global.storageService.setString(AppStorage.THEME_MODE_KEY, _themeModeToString(themeMode));
    state = themeMode;

  }

  ThemeMode _themeModeFromString(String mode) {
    switch (mode) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }

  String _themeModeToString(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.light:
        return 'light';
      case ThemeMode.dark:
        return 'dark';
      default:
        return 'system';
    }
  }
}

// Provider for Theme Mode
final themeModeProvider =
StateNotifierProvider<ThemeModeNotifier, ThemeMode>((ref) {
  return ThemeModeNotifier();
});


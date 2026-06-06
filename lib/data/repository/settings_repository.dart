import 'package:smart_courier_assistant_app/data/datasource/local/settings_shared_preferences.dart';

class SettingsRepository {
  final SettingsSharedPreference settingsSharedPreference;

  SettingsRepository(this.settingsSharedPreference);

  Future<bool> loadThemeMode() async =>
      settingsSharedPreference.loadThemeMode();

  Future<void> saveThemeMode(bool isDarkMode) async {
    await settingsSharedPreference.saveThemeMode(isDarkMode);
  }

  Future<String> loadLanguageCode() async {
    return await settingsSharedPreference.loadLanguageCode();
  }

  Future<void> saveLanguageCode(String languageCode) async {
    await settingsSharedPreference.saveLanguageCode(languageCode);
  }
}

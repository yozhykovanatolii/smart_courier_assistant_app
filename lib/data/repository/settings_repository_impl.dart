import 'package:smart_courier_assistant_app/data/datasource/local/settings_shared_preferences.dart';
import 'package:smart_courier_assistant_app/domain/repository/settings_repository.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  final SettingsSharedPreference settingsSharedPreference;

  SettingsRepositoryImpl(this.settingsSharedPreference);

  @override
  Future<bool> loadThemeMode() async =>
      settingsSharedPreference.loadThemeMode();

  @override
  Future<void> saveThemeMode(bool isDarkMode) async {
    await settingsSharedPreference.saveThemeMode(isDarkMode);
  }

  @override
  Future<String> loadLanguageCode() async {
    return await settingsSharedPreference.loadLanguageCode();
  }

  @override
  Future<void> saveLanguageCode(String languageCode) async {
    await settingsSharedPreference.saveLanguageCode(languageCode);
  }
}

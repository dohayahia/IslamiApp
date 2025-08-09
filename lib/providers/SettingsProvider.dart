import 'package:flutter/material.dart';
// observable
// publisher

// observers
// listeners
// subscribers
class SettingsProvider extends ChangeNotifier{

  ThemeMode themeMode = ThemeMode.light;

  changeTheme(ThemeMode newTheme){
    if(newTheme == themeMode) return;
    themeMode = newTheme;
    notifyListeners();
  }

  String language = "en";

  changeLanguage(String newLanguage){
    if(language == newLanguage) return;
    language = newLanguage;
    notifyListeners();
  }

}
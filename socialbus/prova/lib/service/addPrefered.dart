import 'package:shared_preferences/shared_preferences.dart';

void save(String busShortName,bool value) async {
        final prefs = await SharedPreferences.getInstance();
        final key =busShortName;
        prefs.setBool(key, !value);
        print("è stato salvato $busShortName "+ prefs.getBool(key).toString());
      }
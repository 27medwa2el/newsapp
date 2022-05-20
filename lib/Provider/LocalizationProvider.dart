import 'package:flutter/cupertino.dart';

class LocalizationProvider extends ChangeNotifier {
  String language='en';
  void changeLanguageToEn() {
    if (language == 'ar')
      language = 'en';

  notifyListeners();
  }
  void changeLanguageToAr() {
    if (language == 'en')
      language = 'ar';

    notifyListeners();
  }
}

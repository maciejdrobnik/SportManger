import 'package:get/get.dart';

class LocaleString extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys =>
      {
        'en': {
          "login": "Log in",
          "login2": "Log in 2"
        },
        'nl': {
          "login": "Log in but in Dutch",
          "login2": "Log in 2 but in Dutch"
        }
      };
}
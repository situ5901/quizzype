
import 'package:get/get.dart';
import 'en_in/en_in.dart';
import 'en_us/en_us_translations.dart';
import 'mr_in/mr_in.dart';

class AppLocalization extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': enUs,
    'en_IN': enIN,
    'mr_IN': mrIN
  };
}

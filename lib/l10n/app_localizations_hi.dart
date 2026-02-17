// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get appTitle => 'धीरा फ्लटर टेम्पलेट';

  @override
  String get login => 'लॉगिन';

  @override
  String get register => 'रजिस्टर';

  @override
  String get email => 'ईमेल';

  @override
  String get password => 'पासवर्ड';

  @override
  String get forgotPassword => 'पासवर्ड भूल गए?';

  @override
  String get donHaveAccount => 'क्या आपका खाता नहीं है?';

  @override
  String get dontHaveAccountRegister => 'खाता नहीं है? रजिस्टर करें';

  @override
  String get alreadyHaveAccount => 'पहले से ही एक खाता है?';

  @override
  String get alreadyHaveAccountLogin => 'पहले से ही एक खाता है? लॉगिन करें';

  @override
  String get welcomeBack => 'वापसी पर स्वागत है';

  @override
  String get createAccount => 'खाता बनाएं';

  @override
  String get fullName => 'पूरा नाम';

  @override
  String get fieldRequired => 'आवश्यक';

  @override
  String get invalidEmail => 'अमान्य ईमेल';

  @override
  String get passwordTooShort => 'पासवर्ड बहुत छोटा है';

  @override
  String get dashboard => 'डैशबोर्ड';

  @override
  String get logout => 'लॉगआउट';

  @override
  String get logoutConfirmation => 'क्या आप वाकई लॉगआउट करना चाहते हैं?';

  @override
  String welcomeUser(String name) {
    return 'स्वागत है, $name!';
  }

  @override
  String get dashboardSubtitle => 'यह आपका उद्यम टेम्पलेट डैशबोर्ड है।';

  @override
  String get loginSuccess => 'लॉगिन सफल';

  @override
  String get registerSuccess => 'पंजीकरण सफल';

  @override
  String get somethingWentWrong => 'कुछ गलत हो गया। कृपया पुन: प्रयास करें।';

  @override
  String get noTasksYet => 'अभी तक कोई कार्य नहीं है। एक जोड़ें!';

  @override
  String errorMessage(String message) {
    return 'त्रुटि: $message';
  }

  @override
  String get deleteTask => 'कार्य हटाएं?';

  @override
  String get deleteTaskConfirmation =>
      'क्या आप वाकई इस कार्य को हटाना चाहते हैं?';

  @override
  String get markAsComplete => 'पूर्ण के रूप में चिह्नित करें?';

  @override
  String get markAsCompleteConfirmation =>
      'क्या आप वाकई इस कार्य को पूर्ण के रूप में चिह्नित करना चाहते हैं?';

  @override
  String get confirm => 'पुष्टि करें';

  @override
  String get cancel => 'रद्द करें';

  @override
  String get ok => 'ठीक है';

  @override
  String get error => 'त्रुटि';

  @override
  String get username => 'उपयोगकर्ता नाम';

  @override
  String get passwordLengthError => 'पासवर्ड कम से कम 6 वर्णों का होना चाहिए';

  @override
  String get confirmPassword => 'पासवर्ड की पुष्टि करें';

  @override
  String get passwordsDoNotMatch => 'पासवर्ड मेल नहीं खाते';

  @override
  String get settings => 'सेटिंग्स';

  @override
  String get language => 'भाषा';

  @override
  String get theme => 'थीम';

  @override
  String get darkMode => 'डार्क मोड';

  @override
  String get lightMode => 'लाइट मोड';

  @override
  String get english => 'अंग्रेजी';

  @override
  String get hindi => 'हिंदी';

  @override
  String get selectLanguage => 'भाषा चुनें';

  @override
  String get general => 'सामान्य';

  @override
  String get account => 'खाता';
}

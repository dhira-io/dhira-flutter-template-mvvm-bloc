// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Dhira Flutter Template';

  @override
  String get login => 'Login';

  @override
  String get register => 'Register';

  @override
  String get email => 'Email';

  @override
  String get password => 'Password';

  @override
  String get forgotPassword => 'Forgot Password?';

  @override
  String get donHaveAccount => 'Don\'t have an account?';

  @override
  String get dontHaveAccountRegister => 'Don\'t have an account? Register';

  @override
  String get alreadyHaveAccount => 'Already have an account?';

  @override
  String get alreadyHaveAccountLogin => 'Already have an account? Login';

  @override
  String get welcomeBack => 'Welcome Back';

  @override
  String get createAccount => 'Create Account';

  @override
  String get fullName => 'Full Name';

  @override
  String get fieldRequired => 'Required';

  @override
  String get invalidEmail => 'Invalid Email';

  @override
  String get passwordTooShort => 'Password too short';

  @override
  String get dashboard => 'Dashboard';

  @override
  String welcomeUser(String name) {
    return 'Welcome, $name!';
  }

  @override
  String get settings => 'Settings';

  @override
  String get language => 'Language';

  @override
  String get theme => 'Theme';

  @override
  String get darkMode => 'Dark Mode';

  @override
  String get lightMode => 'Light Mode';

  @override
  String get english => 'English';

  @override
  String get hindi => 'Hindi';

  @override
  String get selectLanguage => 'Select Language';

  @override
  String get general => 'General';

  @override
  String get account => 'Account';

  @override
  String get dashboardSubtitle => 'This is your enterprise template dashboard.';

  @override
  String get loginSuccess => 'Login Successful';

  @override
  String get registerSuccess => 'Registration Successful';

  @override
  String get somethingWentWrong => 'Something went wrong. Please try again.';

  @override
  String get logout => 'Logout';

  @override
  String get logoutConfirmation => 'Are you sure you want to logout?';
}

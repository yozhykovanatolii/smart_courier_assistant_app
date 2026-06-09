// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `The email should not be empty`
  String get emailEmpty {
    return Intl.message(
      'The email should not be empty',
      name: 'emailEmpty',
      desc: '',
      args: [],
    );
  }

  /// `The email entered is in an incorrect format.`
  String get emailIncorrectFormat {
    return Intl.message(
      'The email entered is in an incorrect format.',
      name: 'emailIncorrectFormat',
      desc: '',
      args: [],
    );
  }

  /// `The password must not be empty`
  String get passwordEmpty {
    return Intl.message(
      'The password must not be empty',
      name: 'passwordEmpty',
      desc: '',
      args: [],
    );
  }

  /// `The password must be at least 8 characters long`
  String get passwordLengthLessEight {
    return Intl.message(
      'The password must be at least 8 characters long',
      name: 'passwordLengthLessEight',
      desc: '',
      args: [],
    );
  }

  /// `The password must contain at least one uppercase letter`
  String get passwordContainsUpperLetter {
    return Intl.message(
      'The password must contain at least one uppercase letter',
      name: 'passwordContainsUpperLetter',
      desc: '',
      args: [],
    );
  }

  /// `The password must contain at least one special character`
  String get passwordContainsSpecialCharacter {
    return Intl.message(
      'The password must contain at least one special character',
      name: 'passwordContainsSpecialCharacter',
      desc: '',
      args: [],
    );
  }

  /// `Invalid email, try again.`
  String get invalidEmail {
    return Intl.message(
      'Invalid email, try again.',
      name: 'invalidEmail',
      desc: '',
      args: [],
    );
  }

  /// `User are disabled.`
  String get userDisabled {
    return Intl.message(
      'User are disabled.',
      name: 'userDisabled',
      desc: '',
      args: [],
    );
  }

  /// `Password is wrong, try again.`
  String get wrongPassword {
    return Intl.message(
      'Password is wrong, try again.',
      name: 'wrongPassword',
      desc: '',
      args: [],
    );
  }

  /// `Invalid credential.`
  String get invalidCredential {
    return Intl.message(
      'Invalid credential.',
      name: 'invalidCredential',
      desc: '',
      args: [],
    );
  }

  /// `An unknown authorization exception occurred.`
  String get loginErrorUnknown {
    return Intl.message(
      'An unknown authorization exception occurred.',
      name: 'loginErrorUnknown',
      desc: '',
      args: [],
    );
  }

  /// `Success authorization.`
  String get successAuthorization {
    return Intl.message(
      'Success authorization.',
      name: 'successAuthorization',
      desc: '',
      args: [],
    );
  }

  /// `Account exists with different credentials.`
  String get accountExistsWithDifferentCredentials {
    return Intl.message(
      'Account exists with different credentials.',
      name: 'accountExistsWithDifferentCredentials',
      desc: '',
      args: [],
    );
  }

  /// `Success authorization with Google`
  String get successAuthorizationWithGoogle {
    return Intl.message(
      'Success authorization with Google',
      name: 'successAuthorizationWithGoogle',
      desc: '',
      args: [],
    );
  }

  /// `If an account with this email exists, you will receive a password reset email.`
  String get resetEmailLetter {
    return Intl.message(
      'If an account with this email exists, you will receive a password reset email.',
      name: 'resetEmailLetter',
      desc: '',
      args: [],
    );
  }

  /// `An unknown reset password exception occurred.`
  String get resetPasswordErrorUnknown {
    return Intl.message(
      'An unknown reset password exception occurred.',
      name: 'resetPasswordErrorUnknown',
      desc: '',
      args: [],
    );
  }

  /// `Network error. Try again.`
  String get networkRequestFailed {
    return Intl.message(
      'Network error. Try again.',
      name: 'networkRequestFailed',
      desc: '',
      args: [],
    );
  }

  /// `Too many requests. Please try again later.`
  String get tooManyRequests {
    return Intl.message(
      'Too many requests. Please try again later.',
      name: 'tooManyRequests',
      desc: '',
      args: [],
    );
  }

  /// `Full name must not be empty.`
  String get fullNameEmpty {
    return Intl.message(
      'Full name must not be empty.',
      name: 'fullNameEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Full name must not contain special characters.`
  String get fullNameInvalidFormat {
    return Intl.message(
      'Full name must not contain special characters.',
      name: 'fullNameInvalidFormat',
      desc: '',
      args: [],
    );
  }

  /// `Phone number must not be empty.`
  String get phoneNumberEmpty {
    return Intl.message(
      'Phone number must not be empty.',
      name: 'phoneNumberEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Enter a valid phone number.`
  String get phoneNumberInvalidFormat {
    return Intl.message(
      'Enter a valid phone number.',
      name: 'phoneNumberInvalidFormat',
      desc: '',
      args: [],
    );
  }

  /// `An account already exists for that email.`
  String get emailAlreadyInUse {
    return Intl.message(
      'An account already exists for that email.',
      name: 'emailAlreadyInUse',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a stronger password.`
  String get weakPassword {
    return Intl.message(
      'Please enter a stronger password.',
      name: 'weakPassword',
      desc: '',
      args: [],
    );
  }

  /// `An unknown register exception occurred.`
  String get registerErrorUnknown {
    return Intl.message(
      'An unknown register exception occurred.',
      name: 'registerErrorUnknown',
      desc: '',
      args: [],
    );
  }

  /// `Email is not valid or badly formatted.`
  String get registerInvalidEmail {
    return Intl.message(
      'Email is not valid or badly formatted.',
      name: 'registerInvalidEmail',
      desc: '',
      args: [],
    );
  }

  /// `Success registration`
  String get successRegistration {
    return Intl.message(
      'Success registration',
      name: 'successRegistration',
      desc: '',
      args: [],
    );
  }

  /// `Sign in to your Account`
  String get signInToYourAccount {
    return Intl.message(
      'Sign in to your Account',
      name: 'signInToYourAccount',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message('Email', name: 'email', desc: '', args: []);
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `Enter your email and password to log in`
  String get enterYourEmailAndPasswordToLogIn {
    return Intl.message(
      'Enter your email and password to log in',
      name: 'enterYourEmailAndPasswordToLogIn',
      desc: '',
      args: [],
    );
  }

  /// `Log In`
  String get logIn {
    return Intl.message('Log In', name: 'logIn', desc: '', args: []);
  }

  /// `Continue with Google`
  String get continueWithGoogle {
    return Intl.message(
      'Continue with Google',
      name: 'continueWithGoogle',
      desc: '',
      args: [],
    );
  }

  /// `Or`
  String get or {
    return Intl.message('Or', name: 'or', desc: '', args: []);
  }

  /// `Forgot Password?`
  String get forgotPassword {
    return Intl.message(
      'Forgot Password?',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get signUp {
    return Intl.message('Sign Up', name: 'signUp', desc: '', args: []);
  }

  /// `Don't have an account?`
  String get dontHaveAnAccount {
    return Intl.message(
      'Don\'t have an account?',
      name: 'dontHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email address and we will send you a link to reset your password`
  String get enterYourEmailAddress {
    return Intl.message(
      'Enter your email address and we will send you a link to reset your password',
      name: 'enterYourEmailAddress',
      desc: '',
      args: [],
    );
  }

  /// `Reset password`
  String get resetPassword {
    return Intl.message(
      'Reset password',
      name: 'resetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Create an account to continue!`
  String get createAnAccountToContinue {
    return Intl.message(
      'Create an account to continue!',
      name: 'createAnAccountToContinue',
      desc: '',
      args: [],
    );
  }

  /// `Full name`
  String get fullName {
    return Intl.message('Full name', name: 'fullName', desc: '', args: []);
  }

  /// `Phone number`
  String get phoneNumber {
    return Intl.message(
      'Phone number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message('Register', name: 'register', desc: '', args: []);
  }

  /// `Settings`
  String get settings {
    return Intl.message('Settings', name: 'settings', desc: '', args: []);
  }

  /// `Dark Mode`
  String get darkMode {
    return Intl.message('Dark Mode', name: 'darkMode', desc: '', args: []);
  }

  /// `Language`
  String get language {
    return Intl.message('Language', name: 'language', desc: '', args: []);
  }

  /// `Languages`
  String get languages {
    return Intl.message('Languages', name: 'languages', desc: '', args: []);
  }

  /// `Select the language that is most convenient for you to use the application in.`
  String get selectLanguage {
    return Intl.message(
      'Select the language that is most convenient for you to use the application in.',
      name: 'selectLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Unknown`
  String get unknown {
    return Intl.message('Unknown', name: 'unknown', desc: '', args: []);
  }

  /// `Logout`
  String get logout {
    return Intl.message('Logout', name: 'logout', desc: '', args: []);
  }

  /// `Cancel`
  String get cancel {
    return Intl.message('Cancel', name: 'cancel', desc: '', args: []);
  }

  /// `Yes, Logout`
  String get yesLogout {
    return Intl.message('Yes, Logout', name: 'yesLogout', desc: '', args: []);
  }

  /// `Are you sure you want to log out?`
  String get areYouSureYouWantToLogOut {
    return Intl.message(
      'Are you sure you want to log out?',
      name: 'areYouSureYouWantToLogOut',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message('Profile', name: 'profile', desc: '', args: []);
  }

  /// `Edit profile`
  String get editProfile {
    return Intl.message(
      'Edit profile',
      name: 'editProfile',
      desc: '',
      args: [],
    );
  }

  /// `My routes`
  String get myRoutes {
    return Intl.message('My routes', name: 'myRoutes', desc: '', args: []);
  }

  /// `Save`
  String get save {
    return Intl.message('Save', name: 'save', desc: '', args: []);
  }

  /// `Gallery permission was denied`
  String get storagePermissionDeny {
    return Intl.message(
      'Gallery permission was denied',
      name: 'storagePermissionDeny',
      desc: '',
      args: [],
    );
  }

  /// `Photo was not selected`
  String get photoWasNotSelected {
    return Intl.message(
      'Photo was not selected',
      name: 'photoWasNotSelected',
      desc: '',
      args: [],
    );
  }

  /// `User was not found`
  String get userNotFound {
    return Intl.message(
      'User was not found',
      name: 'userNotFound',
      desc: '',
      args: [],
    );
  }

  /// `Success updating profile`
  String get successUpdatingProfile {
    return Intl.message(
      'Success updating profile',
      name: 'successUpdatingProfile',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'uk'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}

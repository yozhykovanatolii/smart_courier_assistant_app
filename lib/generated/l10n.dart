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

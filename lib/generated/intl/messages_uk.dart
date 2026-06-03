// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a uk locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'uk';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "accountExistsWithDifferentCredentials":
        MessageLookupByLibrary.simpleMessage(
          "Обліковий запис існує з іншими обліковими даними.",
        ),
    "emailEmpty": MessageLookupByLibrary.simpleMessage(
      "Пошта не повинна бути порожньою",
    ),
    "emailIncorrectFormat": MessageLookupByLibrary.simpleMessage(
      "Введена пошта має неправильний формат.",
    ),
    "fullNameEmpty": MessageLookupByLibrary.simpleMessage(
      "Повне ім\'я не повинно бути порожнім.",
    ),
    "fullNameInvalidFormat": MessageLookupByLibrary.simpleMessage(
      "Повне ім\'я не повинно містити спеціальних символів.",
    ),
    "invalidCredential": MessageLookupByLibrary.simpleMessage(
      "Недійсні облікові дані.",
    ),
    "invalidEmail": MessageLookupByLibrary.simpleMessage(
      "Недійсна пошта, спробуйте ще раз.",
    ),
    "loginErrorUnknown": MessageLookupByLibrary.simpleMessage(
      "Сталася невідома помилка авторизації.",
    ),
    "networkRequestFailed": MessageLookupByLibrary.simpleMessage(
      "Network error. Try again.",
    ),
    "passwordContainsSpecialCharacter": MessageLookupByLibrary.simpleMessage(
      "Пароль повинен містити принаймні один спеціальний символ",
    ),
    "passwordContainsUpperLetter": MessageLookupByLibrary.simpleMessage(
      "Пароль повинен містити хоча б одну велику літеру",
    ),
    "passwordEmpty": MessageLookupByLibrary.simpleMessage(
      "Пароль не повинен бути порожнім",
    ),
    "passwordLengthLessEight": MessageLookupByLibrary.simpleMessage(
      "Пароль має містити щонайменше 8 символів",
    ),
    "phoneNumberEmpty": MessageLookupByLibrary.simpleMessage(
      "Номер телефону не може бути порожнім.",
    ),
    "phoneNumberInvalidFormat": MessageLookupByLibrary.simpleMessage(
      "Введіть дійсний номер телефону.",
    ),
    "resetEmailLetter": MessageLookupByLibrary.simpleMessage(
      "Якщо обліковий запис із цією поштою існує, ви отримаєте електронний лист для скидання пароля.",
    ),
    "resetPasswordErrorUnknown": MessageLookupByLibrary.simpleMessage(
      "Сталася невідома помилка скидання пароля.",
    ),
    "successAuthorization": MessageLookupByLibrary.simpleMessage(
      "Успішна авторизація.",
    ),
    "successAuthorizationWithGoogle": MessageLookupByLibrary.simpleMessage(
      "Успішна авторизація через Google",
    ),
    "tooManyRequests": MessageLookupByLibrary.simpleMessage(
      "Too many requests. Please try again later.",
    ),
    "userDisabled": MessageLookupByLibrary.simpleMessage(
      "Користувач вимкнений.",
    ),
    "wrongPassword": MessageLookupByLibrary.simpleMessage(
      "Пароль неправильний, спробуйте ще раз.",
    ),
  };
}

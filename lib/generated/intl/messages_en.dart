// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
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
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "emailEmpty": MessageLookupByLibrary.simpleMessage(
      "The email should not be empty",
    ),
    "emailIncorrectFormat": MessageLookupByLibrary.simpleMessage(
      "The email entered is in an incorrect format.",
    ),
    "passwordContainsSpecialCharacter": MessageLookupByLibrary.simpleMessage(
      "The password must contain at least one special character",
    ),
    "passwordContainsUpperLetter": MessageLookupByLibrary.simpleMessage(
      "The password must contain at least one uppercase letter",
    ),
    "passwordEmpty": MessageLookupByLibrary.simpleMessage(
      "The password must not be empty",
    ),
    "passwordLengthLessEight": MessageLookupByLibrary.simpleMessage(
      "The password must be at least 8 characters long",
    ),
  };
}

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
    "accountExistsWithDifferentCredentials":
        MessageLookupByLibrary.simpleMessage(
          "Account exists with different credentials.",
        ),
    "address": MessageLookupByLibrary.simpleMessage("Address"),
    "addressEmpty": MessageLookupByLibrary.simpleMessage(
      "Address must not be empty.",
    ),
    "addressInvalidFormat": MessageLookupByLibrary.simpleMessage(
      "Please enter the order address correctly.",
    ),
    "areYouGoingToDeleteOrder": MessageLookupByLibrary.simpleMessage(
      "You\'re going to delete an order. Are you sure?",
    ),
    "areYouSureYouWantToLogOut": MessageLookupByLibrary.simpleMessage(
      "Are you sure you want to log out?",
    ),
    "atRisk": MessageLookupByLibrary.simpleMessage("At risk"),
    "call": MessageLookupByLibrary.simpleMessage("📞 Call"),
    "callUnavailable": MessageLookupByLibrary.simpleMessage(
      "Call is unavailable. Try again.",
    ),
    "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
    "category": MessageLookupByLibrary.simpleMessage("Category"),
    "chat": MessageLookupByLibrary.simpleMessage("💬 Chat"),
    "client": MessageLookupByLibrary.simpleMessage("Client"),
    "comment": MessageLookupByLibrary.simpleMessage("Comment"),
    "confirm": MessageLookupByLibrary.simpleMessage("Confirm"),
    "contactPhone": MessageLookupByLibrary.simpleMessage("Contact Phone"),
    "continueWithGoogle": MessageLookupByLibrary.simpleMessage(
      "Continue with Google",
    ),
    "createAnAccountToContinue": MessageLookupByLibrary.simpleMessage(
      "Create an account to continue!",
    ),
    "darkMode": MessageLookupByLibrary.simpleMessage("Dark Mode"),
    "delayed": MessageLookupByLibrary.simpleMessage("Delayed"),
    "deletingOrder": MessageLookupByLibrary.simpleMessage("Deleting order"),
    "docs": MessageLookupByLibrary.simpleMessage("Documentation"),
    "done": MessageLookupByLibrary.simpleMessage("✅ Done"),
    "dontHaveAnAccount": MessageLookupByLibrary.simpleMessage(
      "Don\'t have an account?",
    ),
    "editProfile": MessageLookupByLibrary.simpleMessage("Edit profile"),
    "email": MessageLookupByLibrary.simpleMessage("Email"),
    "emailAlreadyInUse": MessageLookupByLibrary.simpleMessage(
      "An account already exists for that email.",
    ),
    "emailEmpty": MessageLookupByLibrary.simpleMessage(
      "The email should not be empty",
    ),
    "emailIncorrectFormat": MessageLookupByLibrary.simpleMessage(
      "The email entered is in an incorrect format.",
    ),
    "enterComment": MessageLookupByLibrary.simpleMessage("Enter comment..."),
    "enterYourEmailAddress": MessageLookupByLibrary.simpleMessage(
      "Enter your email address and we will send you a link to reset your password",
    ),
    "enterYourEmailAndPasswordToLogIn": MessageLookupByLibrary.simpleMessage(
      "Enter your email and password to log in",
    ),
    "food": MessageLookupByLibrary.simpleMessage("Food"),
    "forgotPassword": MessageLookupByLibrary.simpleMessage("Forgot Password?"),
    "fullName": MessageLookupByLibrary.simpleMessage("Full name"),
    "fullNameEmpty": MessageLookupByLibrary.simpleMessage(
      "Full name must not be empty.",
    ),
    "fullNameInvalidFormat": MessageLookupByLibrary.simpleMessage(
      "Full name must not contain special characters.",
    ),
    "invalidCredential": MessageLookupByLibrary.simpleMessage(
      "Invalid credential.",
    ),
    "invalidEmail": MessageLookupByLibrary.simpleMessage(
      "Invalid email, try again.",
    ),
    "language": MessageLookupByLibrary.simpleMessage("Language"),
    "languages": MessageLookupByLibrary.simpleMessage("Languages"),
    "locationNotFound": MessageLookupByLibrary.simpleMessage(
      "Location did not find by address",
    ),
    "locationPermissionDenied": MessageLookupByLibrary.simpleMessage(
      "Location permissions are denied",
    ),
    "locationServiceDisabled": MessageLookupByLibrary.simpleMessage(
      "Location services are disabled.",
    ),
    "logIn": MessageLookupByLibrary.simpleMessage("Log In"),
    "loginErrorUnknown": MessageLookupByLibrary.simpleMessage(
      "An unknown authorization exception occurred.",
    ),
    "logout": MessageLookupByLibrary.simpleMessage("Logout"),
    "messageUnavailable": MessageLookupByLibrary.simpleMessage(
      "Message is unavailable. Try again.",
    ),
    "myRoutes": MessageLookupByLibrary.simpleMessage("My routes"),
    "networkRequestFailed": MessageLookupByLibrary.simpleMessage(
      "Network error. Try again.",
    ),
    "noCancelIt": MessageLookupByLibrary.simpleMessage("No, Cancel It."),
    "noKeepIt": MessageLookupByLibrary.simpleMessage("No, Keep It."),
    "onTime": MessageLookupByLibrary.simpleMessage("On time"),
    "optimizeRoute": MessageLookupByLibrary.simpleMessage("Optimize route"),
    "or": MessageLookupByLibrary.simpleMessage("Or"),
    "orders": MessageLookupByLibrary.simpleMessage("Orders"),
    "ordersNotFound": MessageLookupByLibrary.simpleMessage(
      "Orders weren\'t found",
    ),
    "parcel": MessageLookupByLibrary.simpleMessage("Parcel"),
    "password": MessageLookupByLibrary.simpleMessage("Password"),
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
    "phoneNumber": MessageLookupByLibrary.simpleMessage("Phone number"),
    "phoneNumberEmpty": MessageLookupByLibrary.simpleMessage(
      "Phone number must not be empty.",
    ),
    "phoneNumberInvalidFormat": MessageLookupByLibrary.simpleMessage(
      "Enter a valid phone number.",
    ),
    "photo": MessageLookupByLibrary.simpleMessage("Photo"),
    "photoWasNotSelected": MessageLookupByLibrary.simpleMessage(
      "Photo was not selected",
    ),
    "profile": MessageLookupByLibrary.simpleMessage("Profile"),
    "proofOfDelivery": MessageLookupByLibrary.simpleMessage(
      "Proof of delivery",
    ),
    "register": MessageLookupByLibrary.simpleMessage("Register"),
    "registerErrorUnknown": MessageLookupByLibrary.simpleMessage(
      "An unknown register exception occurred.",
    ),
    "registerInvalidEmail": MessageLookupByLibrary.simpleMessage(
      "Email is not valid or badly formatted.",
    ),
    "resetEmailLetter": MessageLookupByLibrary.simpleMessage(
      "If an account with this email exists, you will receive a password reset email.",
    ),
    "resetPassword": MessageLookupByLibrary.simpleMessage("Reset password"),
    "resetPasswordErrorUnknown": MessageLookupByLibrary.simpleMessage(
      "An unknown reset password exception occurred.",
    ),
    "routeNotFound": MessageLookupByLibrary.simpleMessage(
      "Route was not found",
    ),
    "routeOptimizationInProgress": MessageLookupByLibrary.simpleMessage(
      "Route optimization in progress. Please wait a few minutes.",
    ),
    "routeWasNotFound": MessageLookupByLibrary.simpleMessage(
      "Route was not found",
    ),
    "routesWereNotFound": MessageLookupByLibrary.simpleMessage(
      "Routes were not found",
    ),
    "save": MessageLookupByLibrary.simpleMessage("Save"),
    "saveOrder": MessageLookupByLibrary.simpleMessage("Save order"),
    "selectLanguage": MessageLookupByLibrary.simpleMessage(
      "Select the language that is most convenient for you to use the application in.",
    ),
    "settings": MessageLookupByLibrary.simpleMessage("Settings"),
    "signInToYourAccount": MessageLookupByLibrary.simpleMessage(
      "Sign in to your Account",
    ),
    "signUp": MessageLookupByLibrary.simpleMessage("Sign Up"),
    "somethingWentWrong": MessageLookupByLibrary.simpleMessage(
      "Something went wrong",
    ),
    "storagePermissionDeny": MessageLookupByLibrary.simpleMessage(
      "Gallery permission was denied",
    ),
    "successAuthorization": MessageLookupByLibrary.simpleMessage(
      "Success authorization.",
    ),
    "successAuthorizationWithGoogle": MessageLookupByLibrary.simpleMessage(
      "Success authorization with Google",
    ),
    "successConfirmingADelivery": MessageLookupByLibrary.simpleMessage(
      "Success confirming a delivery",
    ),
    "successDeletingOrder": MessageLookupByLibrary.simpleMessage(
      "Success deleting order",
    ),
    "successRegistration": MessageLookupByLibrary.simpleMessage(
      "Success registration",
    ),
    "successSavingOrder": MessageLookupByLibrary.simpleMessage(
      "Success saving order",
    ),
    "successUpdatingProfile": MessageLookupByLibrary.simpleMessage(
      "Success updating profile",
    ),
    "tooManyRequests": MessageLookupByLibrary.simpleMessage(
      "Too many requests. Please try again later.",
    ),
    "unknown": MessageLookupByLibrary.simpleMessage("Unknown"),
    "userDisabled": MessageLookupByLibrary.simpleMessage("User are disabled."),
    "userNotFound": MessageLookupByLibrary.simpleMessage("User was not found"),
    "weakPassword": MessageLookupByLibrary.simpleMessage(
      "Please enter a stronger password.",
    ),
    "wrongPassword": MessageLookupByLibrary.simpleMessage(
      "Password is wrong, try again.",
    ),
    "yesConfirmIt": MessageLookupByLibrary.simpleMessage("Yes, Confirm It!"),
    "yesDeleteIt": MessageLookupByLibrary.simpleMessage("Yes, Delete It!"),
    "yesLogout": MessageLookupByLibrary.simpleMessage("Yes, Logout"),
  };
}

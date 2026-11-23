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

  static String m0(Object clientFullName) => "Клієнт: ${clientFullName}";

  static String m1(Object clientPhoneNumber) =>
      "Номер телефону: ${clientPhoneNumber}";

  static String m2(
    Object deliverByHour,
    Object deliverByMinute,
    Object plannedEtaHour,
    Object plannedEtaMinute,
    Object deliveryRisk,
  ) =>
      "Доставити до ${deliverByHour}:${deliverByMinute} • ETA ${plannedEtaHour}:${plannedEtaMinute} • ${deliveryRisk}";

  static String m3(Object orderDeliveryRisk) =>
      "Ризик доставки: ${orderDeliveryRisk}";

  static String m4(Object orderAddress) => "Адреса: ${orderAddress}";

  static String m5(Object orderDeliverBy) => "Доставити до: ${orderDeliverBy}";

  static String m6(Object orderId) => "Замовлення #${orderId}";

  static String m7(Object orderPlannedEta) =>
      "Запланована ETA: ${orderPlannedEta}";

  static String m8(Object orderStatus) => "Статус: ${orderStatus}";

  static String m9(Object ordersCount, Object delayedOrdersCount) =>
      "📦 ${ordersCount} замовлень | ⚠️ ${delayedOrdersCount} затримані";

  static String m10(Object delayedOrdersAmount) =>
      "${delayedOrdersAmount} затримані";

  static String m11(Object routeId) => "Маршрут #${routeId}";

  static String m12(Object ordersAmount) => "${ordersAmount} замовлень";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "accessDenied": MessageLookupByLibrary.simpleMessage("Доступ заборонено"),
    "accountExistsWithDifferentCredentials":
        MessageLookupByLibrary.simpleMessage(
          "Обліковий запис існує з іншими обліковими даними.",
        ),
    "address": MessageLookupByLibrary.simpleMessage("Адреса"),
    "addressEmpty": MessageLookupByLibrary.simpleMessage(
      "Адреса замовлення не повинна бути пустою.",
    ),
    "addressInvalidFormat": MessageLookupByLibrary.simpleMessage(
      "Введіть корректно адресу замовлення.",
    ),
    "areYouGoingToDeleteOrder": MessageLookupByLibrary.simpleMessage(
      "You\'re going to delete an order. Are you sure?",
    ),
    "areYouSureYouWantToLogOut": MessageLookupByLibrary.simpleMessage(
      "Ви впевнені, що хочете вийти?",
    ),
    "atRisk": MessageLookupByLibrary.simpleMessage("Під ризиком"),
    "call": MessageLookupByLibrary.simpleMessage("📞 Виклик"),
    "callUnavailable": MessageLookupByLibrary.simpleMessage(
      "Виклик недоступний. Спробуйте ще раз.",
    ),
    "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
    "category": MessageLookupByLibrary.simpleMessage("Категорії"),
    "chat": MessageLookupByLibrary.simpleMessage("💬 Чат"),
    "client": MessageLookupByLibrary.simpleMessage("Клієнт"),
    "clientFullNamePdfText": m0,
    "clientPhoneNumberPdfText": m1,
    "comment": MessageLookupByLibrary.simpleMessage("Коментарій"),
    "confirm": MessageLookupByLibrary.simpleMessage("Підтвердити"),
    "contactPhone": MessageLookupByLibrary.simpleMessage("Номер телефону"),
    "continueWithGoogle": MessageLookupByLibrary.simpleMessage(
      "Увійти через Google",
    ),
    "createAnAccountToContinue": MessageLookupByLibrary.simpleMessage(
      "Створіть обліковий запис, щоб продовжити!",
    ),
    "darkMode": MessageLookupByLibrary.simpleMessage("Темна тема"),
    "dataNotFound": MessageLookupByLibrary.simpleMessage(
      "Дані не були знайдені",
    ),
    "delayed": MessageLookupByLibrary.simpleMessage("Затримається"),
    "deletingOrder": MessageLookupByLibrary.simpleMessage(
      "Видалити замовлення",
    ),
    "deliverByEtaAndRisk": m2,
    "deliveryRiskPdfText": m3,
    "docs": MessageLookupByLibrary.simpleMessage("Документ"),
    "done": MessageLookupByLibrary.simpleMessage("✅ Зроблено"),
    "dontHaveAnAccount": MessageLookupByLibrary.simpleMessage(
      "Немаєш облікового запису?",
    ),
    "editProfile": MessageLookupByLibrary.simpleMessage("Редагування профілю"),
    "email": MessageLookupByLibrary.simpleMessage("Пошта"),
    "emailAlreadyInUse": MessageLookupByLibrary.simpleMessage(
      "Для цієї пошти вже існує обліковий запис.",
    ),
    "emailEmpty": MessageLookupByLibrary.simpleMessage(
      "Пошта не повинна бути порожньою",
    ),
    "emailIncorrectFormat": MessageLookupByLibrary.simpleMessage(
      "Введена пошта має неправильний формат.",
    ),
    "emailNotVerified": MessageLookupByLibrary.simpleMessage(
      "Пошта не підтверджена",
    ),
    "enterComment": MessageLookupByLibrary.simpleMessage(
      "Введіть коментарій...",
    ),
    "enterYourEmailAddress": MessageLookupByLibrary.simpleMessage(
      "Введіть свою пошту, і ми надішлемо вам посилання для скидання пароля",
    ),
    "enterYourEmailAndPasswordToLogIn": MessageLookupByLibrary.simpleMessage(
      "Введіть свою пошту та пароль для входу",
    ),
    "failedCalculateOptimalRoute": MessageLookupByLibrary.simpleMessage(
      "Не вдалося розрахувати оптимальний маршрут. Спробуйте ще раз.",
    ),
    "food": MessageLookupByLibrary.simpleMessage("Їжа"),
    "forgotPassword": MessageLookupByLibrary.simpleMessage("Забув Пароль?"),
    "fullName": MessageLookupByLibrary.simpleMessage("ПІБ"),
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
    "language": MessageLookupByLibrary.simpleMessage("Мова"),
    "languages": MessageLookupByLibrary.simpleMessage("Мови"),
    "locationNotFound": MessageLookupByLibrary.simpleMessage(
      "Місцезнаходження не знайдено за адресою",
    ),
    "locationPermissionDenied": MessageLookupByLibrary.simpleMessage(
      "Дозволи на доступ до геоданих відхилено",
    ),
    "locationServiceDisabled": MessageLookupByLibrary.simpleMessage(
      "Служби визначення місцезнаходження вимкнено.",
    ),
    "logIn": MessageLookupByLibrary.simpleMessage("Увійти"),
    "loginErrorUnknown": MessageLookupByLibrary.simpleMessage(
      "Сталася невідома помилка авторизації.",
    ),
    "logout": MessageLookupByLibrary.simpleMessage("Вихід з аккаунту"),
    "messageUnavailable": MessageLookupByLibrary.simpleMessage(
      "Повідомлення недоступне. Спробуйте ще раз.",
    ),
    "myRoutes": MessageLookupByLibrary.simpleMessage("Мої маршрути"),
    "networkRequestFailed": MessageLookupByLibrary.simpleMessage(
      "Помилка мережі. Спробуйте ще раз.",
    ),
    "noCancelIt": MessageLookupByLibrary.simpleMessage("Ні, відмінити"),
    "noKeepIt": MessageLookupByLibrary.simpleMessage("Ні, зберегти"),
    "onTime": MessageLookupByLibrary.simpleMessage("Вчасно"),
    "optimizeRoute": MessageLookupByLibrary.simpleMessage("Оптимізувати"),
    "or": MessageLookupByLibrary.simpleMessage("Або"),
    "orderAddressPdfText": m4,
    "orderDeliverByPdfText": m5,
    "orderId": m6,
    "orderPlannedEtaPdfText": m7,
    "orderStatusPdfText": m8,
    "orders": MessageLookupByLibrary.simpleMessage("Замовлення"),
    "ordersAndDelayedOrdersCount": m9,
    "ordersNotFound": MessageLookupByLibrary.simpleMessage(
      "Замовлення не знайдено",
    ),
    "parcel": MessageLookupByLibrary.simpleMessage("Посилка"),
    "password": MessageLookupByLibrary.simpleMessage("Пароль"),
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
    "passwordNotVerified": MessageLookupByLibrary.simpleMessage(
      "Пароль не було перевірено",
    ),
    "phoneNumber": MessageLookupByLibrary.simpleMessage("Номер телефону"),
    "phoneNumberEmpty": MessageLookupByLibrary.simpleMessage(
      "Номер телефону не може бути порожнім.",
    ),
    "phoneNumberInvalidFormat": MessageLookupByLibrary.simpleMessage(
      "Введіть дійсний номер телефону.",
    ),
    "photo": MessageLookupByLibrary.simpleMessage("Фото замовлення"),
    "photoWasNotSelected": MessageLookupByLibrary.simpleMessage(
      "Фотографію не вибрано",
    ),
    "profile": MessageLookupByLibrary.simpleMessage("Профіль"),
    "proofOfDelivery": MessageLookupByLibrary.simpleMessage("Докази доставки"),
    "register": MessageLookupByLibrary.simpleMessage("Зареєструватися"),
    "registerErrorUnknown": MessageLookupByLibrary.simpleMessage(
      "Сталася невідома помилка під час регістрації.",
    ),
    "registerInvalidEmail": MessageLookupByLibrary.simpleMessage(
      "Пошта недійсна або неправильно відформатована.",
    ),
    "registerValidationFailed": MessageLookupByLibrary.simpleMessage(
      "Помилка валідації. Будь ласка, перевірте введені дані.",
    ),
    "resetEmailLetter": MessageLookupByLibrary.simpleMessage(
      "Якщо обліковий запис із цією поштою існує, ви отримаєте електронний лист для скидання пароля.",
    ),
    "resetPassword": MessageLookupByLibrary.simpleMessage("Скинути пароль"),
    "resetPasswordErrorUnknown": MessageLookupByLibrary.simpleMessage(
      "Сталася невідома помилка скидання пароля.",
    ),
    "routeDelayedOrdersCount": m10,
    "routeDetail": MessageLookupByLibrary.simpleMessage("Деталі маршруту"),
    "routeIdText": m11,
    "routeNotFound": MessageLookupByLibrary.simpleMessage(
      "Маршрут не знайдено",
    ),
    "routeOptimizationInProgress": MessageLookupByLibrary.simpleMessage(
      "Триває оптимізація маршруту. Будь ласка, зачекайте кілька хвилин.",
    ),
    "routeOrdersCount": m12,
    "routesWereNotFound": MessageLookupByLibrary.simpleMessage(
      "Маршрути не були знайдені",
    ),
    "save": MessageLookupByLibrary.simpleMessage("Зберегти"),
    "saveOrder": MessageLookupByLibrary.simpleMessage("Зберегти замовлення"),
    "selectLanguage": MessageLookupByLibrary.simpleMessage(
      "Виберіть мову, якою вам найзручніше користуватися застосунком.",
    ),
    "settings": MessageLookupByLibrary.simpleMessage("Налаштування"),
    "signInToYourAccount": MessageLookupByLibrary.simpleMessage(
      "Увійдіть до свого облікового запису",
    ),
    "signUp": MessageLookupByLibrary.simpleMessage("Зареєструватися"),
    "somethingWentWrong": MessageLookupByLibrary.simpleMessage(
      "Щось пішло не так",
    ),
    "storagePermissionDeny": MessageLookupByLibrary.simpleMessage(
      "У доступі до галереї відмовлено",
    ),
    "successAuthorization": MessageLookupByLibrary.simpleMessage(
      "Успішна авторизація.",
    ),
    "successAuthorizationWithGoogle": MessageLookupByLibrary.simpleMessage(
      "Успішна авторизація через Google",
    ),
    "successConfirmingADelivery": MessageLookupByLibrary.simpleMessage(
      "Успішне підтвердження замовлення",
    ),
    "successDeletingOrder": MessageLookupByLibrary.simpleMessage(
      "Успішне видалення замовлення",
    ),
    "successRegistration": MessageLookupByLibrary.simpleMessage(
      "Успішна регістрація",
    ),
    "successSavingOrder": MessageLookupByLibrary.simpleMessage(
      "Успішне збереження замовлення",
    ),
    "successUpdatingProfile": MessageLookupByLibrary.simpleMessage(
      "Успішне оновлення профілю",
    ),
    "tooManyRequests": MessageLookupByLibrary.simpleMessage(
      "Забагато запитів. Спробуйте пізніше.",
    ),
    "unknown": MessageLookupByLibrary.simpleMessage("Невідомий"),
    "userDisabled": MessageLookupByLibrary.simpleMessage(
      "Користувач вимкнений.",
    ),
    "userNotFound": MessageLookupByLibrary.simpleMessage(
      "Користувач не був знайдений",
    ),
    "weakPassword": MessageLookupByLibrary.simpleMessage(
      "Будь ласка, введіть надійніший пароль.",
    ),
    "wrongPassword": MessageLookupByLibrary.simpleMessage(
      "Пароль неправильний, спробуйте ще раз.",
    ),
    "yesConfirmIt": MessageLookupByLibrary.simpleMessage("Так, підтвердити!"),
    "yesDeleteIt": MessageLookupByLibrary.simpleMessage("Так, видалити!"),
    "yesLogout": MessageLookupByLibrary.simpleMessage("Так, вийти"),
  };
}

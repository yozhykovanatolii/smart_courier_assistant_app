import 'package:formz/formz.dart';

enum AddressInputError { empty, invalidFormat }

class AddressValidator extends FormzInput<String, AddressInputError> {
  const AddressValidator.pure() : super.pure('');

  const AddressValidator.dirty({String address = ''}) : super.dirty(address);

  @override
  AddressInputError? validator(String address) {
    final addressRegExp = RegExp(
      r"^[A-ZА-ЯІЇЄҐ][A-Za-zА-Яа-яІЇЄҐіїєґ' -]+,\s[A-Za-zА-Яа-яІЇЄҐіїєґ. -]+\s\d+[A-Za-zА-Яа-яІЇЄҐіїєґ]?$",
    );
    if (address.isEmpty) return AddressInputError.empty;
    if (!addressRegExp.hasMatch(address)) {
      return AddressInputError.invalidFormat;
    }
    return null;
  }
}

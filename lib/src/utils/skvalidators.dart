import '../services/email.dart';
import '../services/phone.dart';

/// SK Services Validator
///
/// Email
/// Password
/// Phone Number
class SkValidators {
  // Email Validation
  String? email(String? value, String? onError) {
    if (EmailValidator.validate(value!)) return null;
    return onError ?? "Invalid Email";
  }

  // Password Validation
  String? password(String? value, int? minDigit, String? onError) {
    if (value!.length > (minDigit ?? 6)) {
      return null;
    }
    return onError ?? "Password must be at least 8 charrector";
  }

  // Phone Validation
  String? validatePhone(String? value, String? onError) {
    bool isValid = KhmerPhoneValidator.validPhone(value!).status ?? true;
    if (isValid) {
      return null;
    }

    return onError ?? "Invalid Phone number";
  }
}

// Defines a class for contact form validation.
class ContactFormValidator {
  // Regular expressions for validation.
  static RegExp nameRegex = RegExp(r'^[a-zA-Z]+(?:\s[a-zA-Z]+)?$');
  static RegExp phoneRegex = RegExp(r'^(\+\d{1,2}\s)?[-+\d\(\)]+$');
  static RegExp emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');


  // Validates first name, ensuring it's not empty and matches the name pattern.
  static String? validateFirstName(String? value) {
    if (value == null || value.isEmpty) {
      return 'First Name can\'t be empty';
    }
    if (!nameRegex.hasMatch(value)) {
      return 'Invalid name';
    }
    return null;
  }

  // Validates last name, allowing it to be empty but checking the pattern if provided.
  static String? validateLastName(String? value) {
    if ((value != null && value.isNotEmpty) && !(nameRegex.hasMatch(value))) {
      return 'Invalid name';
    }
    return null;
  }

  // Validates email, checking for emptiness and matching the email pattern.
  static String? validateEmail(String? value) {
    if ((value != null && value.isNotEmpty) && !(emailRegex.hasMatch(value))) {
      return 'Invalid email';
    }
    return null;
  }

  // Validates phone number, ensuring it's not empty, matches the phone pattern, and has at least 10 digits.
  static String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number can\'t be empty';
    }

    if (!(phoneRegex.hasMatch(value))) {
      return 'Invalid phone number';
    }
    if (value.length < 10) {
      return 'Incomplete phone number';
    }
    return null;
  }

}

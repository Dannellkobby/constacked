import 'package:constacked/app/app.gorouter.dart';
import 'package:constacked/app/app.locator.dart';
import 'package:constacked/models/contact.dart';
import 'package:constacked/services/contacts_service.dart';
import 'package:constacked/ui/bottom_sheets/add_contact/add_contact_sheet.form.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class AddContactSheetModel extends FormViewModel {
  final formKey = GlobalKey<FormState>();
  final _contactService = locator<ContactsService>();

  // Handles the "Add Contact" button press.
  void onPressedAddContact() {
    // Validates the form and checks its validity.
    validateForm();
    formKey.currentState?.validate();
    if (isFormValid) {
      _contactService.addContact(
        Contact(
          firstName: '$firstNameValue',
          lastName: '$lastNameValue',
          phoneNumber: '$phoneNumberValue',
          nickname: nicknameValue,
          relationship: relationshipValue,
          email: emailValue,
          groups: groupsValue,
          notes: notesValue,
        ),
      );
      router.pop();
    }
  }
}

import 'package:constacked/app/app.gorouter.dart';
import 'package:constacked/app/app.locator.dart';
import 'package:constacked/models/contact.dart';
import 'package:constacked/services/contacts_service.dart';
import 'package:constacked/ui/bottom_sheets/add_contact/add_contact_sheet.form.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ContactDetailsViewModel extends FormViewModel {
  final _contactService = locator<ContactsService>();

  // Properties for contact data, edit mode, and form key
  late Contact contact;
  late final String _selectedContactId;
  bool editMode = false;
  final formKey = GlobalKey<FormState>();

  /// Setter for selectedContactId to update contact data
  set selectedContactId(String value) {
    _selectedContactId = value;
    contact = _contactService.contacts
        .firstWhere((contact) => contact.id == _selectedContactId);
    notifyListeners();
  }

  /// Handle back button press, validating form if in edit mode
  void onPressedBack() {
    if (editMode && (formKey.currentState?.validate() ?? false)) {
      editMode = false;
      notifyListeners();
    } else {
      router.pop();
    }
  }

  /// Toggle edit mode and handle form submission
  void toggleEditMode() {
    if (!editMode) {
      editMode = true;
    } else if (editMode) {
      if (formKey.currentState?.validate() ?? false) {
        _contactService.updateContact(
          Contact(
            id: _selectedContactId,
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
        // Refresh contact data after update
        contact = _contactService.contacts
            .firstWhere((contact) => contact.id == _selectedContactId);
        editMode = false;
      }
    }

    notifyListeners();
  }

  /// Handle contact deletion
  void onPressedDelete() {
    _contactService.deleteContact(_selectedContactId);
    router.pop();
  }
}

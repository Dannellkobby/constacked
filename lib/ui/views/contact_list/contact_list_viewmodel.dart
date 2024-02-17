import 'package:constacked/app/app.bottomsheets.dart';
import 'package:constacked/app/app.gorouter.dart';
import 'package:constacked/app/app.locator.dart';
import 'package:constacked/models/contact.dart';
import 'package:constacked/services/contacts_service.dart';
import 'package:constacked/ui/common/app_keys.dart';
import 'package:stacked/stacked.dart';

import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

class ContactListViewModel extends ReactiveViewModel {
  final _contactService = locator<ContactsService>();
  final _bottomSheetService = locator<BottomSheetService>();

  // Search query
  String _searchQuery = ''; // Search query

  // Text editing controller for search
  final TextEditingController tecSearchContact =
      TextEditingController(); // Add controller

  // Focus node for search
  final FocusNode fnSearchContact = FocusNode(); // Add controller

  /// Getter for contacts from service
  List<Contact> get contacts => _contactService.contacts;


  /// Getter for search query
  String get searchQuery => _searchQuery;

  @override
  List<ListenableServiceMixin> get listenableServices => [_contactService];

  get filteredContacts => _contactService.filteredContacts;


  /// Clear search query and reset filters
  void clearSearchQuery() {
    _searchQuery = '';
    tecSearchContact.clear();
    fnSearchContact.unfocus();
    _contactService.filterContacts(_searchQuery);
  }

  /// Handle microphone button press (implement logic as needed)
  void onPressedIconMic() {
    fnSearchContact.requestFocus();
  }

  /// Clear search query on clear icon press
  void onPressedIconClear() {
    clearSearchQuery();
  }

  /// Show "Add Contact" bottom sheet
  void onPressedAddNewContact() {
    _bottomSheetService.showCustomSheet(
        variant: BottomSheetType.addContact, isScrollControlled: true);
  }

  /// Handle contact tap and navigate to details page
  void onTapContact(String? id) {
    if (id == null) return;
    // _contactService.selectedContactId = id;
    router.pushNamed(krContacts, pathParameters: {kkContactId: id});
  }

  /// Sort contacts alphabetically
  void sortContactsAtoZ() {
    _contactService.sortContactsAtoZ();
  }

  @override
  void dispose() {
    tecSearchContact.dispose();
    fnSearchContact.dispose();
    super.dispose();
  }

  void filterContacts(String s) {
    _contactService.filterContacts(s);
  }

}

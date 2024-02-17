import 'package:constacked/models/contact.dart';
import 'package:constacked/ui/common/app_keys.dart';
import 'package:faker/faker.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:stacked/stacked.dart';

// Define the ContactsService, responsible for managing contact data using Hive and Stacked.
class ContactsService with ListenableServiceMixin {
  // ReactiveValue holding a list of contacts for reactive updates.
  final _contacts = ReactiveValue<List<Contact>>(
      Hive.box(kkBoxContacts).values.toList().cast<Contact>());
  List<Contact> _filteredContacts = []; // Filtered contacts to display

  /// Getter for accessing the contacts list.
  List<Contact> get contacts => _contacts.value;

  /// Getter for contacts from service
  List<Contact> get filteredContacts => _filteredContacts;

  // Constructor, initializing the service and listening to changes in the _contacts value.
  ContactsService() {
    listenToReactiveValues([_contacts]);
  }

  /// Filter contacts based on search query
  void filterContacts(String query) {
    if (query.isEmpty) {
      _filteredContacts = contacts;
    } else {
      _filteredContacts = contacts.where((contact) {
        // Filter contacts starting with the query phrase || containing the query phrase anywhere
        return (contact.fullName
            .toLowerCase()
            .startsWith(query.toLowerCase())) ||
            contact.fullName.toLowerCase().contains(query.toLowerCase());
      }).toList();
      filteredContacts.sort((a, b) {
        // Compare the index of the query phrase occurrence in the contacts' names
        int indexA = a.fullName.toLowerCase().indexOf(query.toLowerCase());
        int indexB = b.fullName.toLowerCase().indexOf(query.toLowerCase());

        // Sort contacts by the index of the query phrase occurrence
        return indexA.compareTo(indexB);
      });
    }
    notifyListeners();
  }

  /// Generates random contacts and stores them in Hive.
  Future<void> generateInitialContacts(int count) async {
    generateRandomContacts(count).forEach((contact) {
      if (kDebugMode) {
        print(
            'Generated contact to Hive: ${contact.toString()}');
      }
      Hive.box(kkBoxContacts).put(contact.id, contact);
      _contacts.value.add(contact);
    });
  }

  /// Sorts contacts alphabetically by full name.
  void sortContactsAtoZ() {
    _contacts.value.sort(
        (a, b) => a.fullName.toLowerCase().compareTo(b.fullName.toLowerCase()));
  }

  /// Adds a new contact to Hive and the reactive list, sorting afterward.
  void addContact(Contact contact) {
    Hive.box(kkBoxContacts).put(contact.id, contact);
    if (kDebugMode) {
      print('Added contact to Hive box | ${contact.toString()}');
    }
    _contacts.value.add(contact);
    sortContactsAtoZ();
    notifyListeners();
  }

  /// Generates a specified number of random contacts using the Faker library.
  List<Contact> generateRandomContacts(int count) {
    if (kDebugMode) print('About to generate $count random contacts');
    final faker = Faker();
    final List<Contact> contacts = [];
    for (int i = 0; i < count; i++) {
      contacts.add(Contact(
        firstName: faker.person.firstName(),
        lastName: faker.person.lastName(),
        phoneNumber: faker.phoneNumber.us().replaceAll(RegExp(r'\D'), ''),
        email: faker.internet.email(),
        nickname:
            '${faker.person.prefix()} ${faker.person.firstName().substring(0, 1)}',
        notes: faker.lorem.sentence(),
        relationship: faker.lorem.word(),
        groups: faker.lorem.word(),
      ));
    }
    if (kDebugMode) print('Completed generating $count random contacts');
    return contacts;
  }

  /// Updates an existing contact in Hive and the reactive list, sorting afterward.
  void updateContact(Contact contact) {
    Hive.box(kkBoxContacts).put(contact.id, contact);
    if (kDebugMode) {
      print('Updated contact in Hive box | ${contact.toString()}');
    }
    _contacts.value.removeWhere((element) => element.id == contact.id); // remove old contact
    _contacts.value.add(contact); // add updated contact
    _filteredContacts.removeWhere((element) => element.id == contact.id); // remove old contact
    _filteredContacts.add(contact); // add updated contact
    sortContactsAtoZ();
    notifyListeners();
  }

  /// Deletes a contact from Hive and the reactive list.
  void deleteContact(String selectedContactId) {
    Hive.box(kkBoxContacts).delete(selectedContactId);
    if (kDebugMode) {
      print('Deleted contact from Hive box | $selectedContactId');
    }
    _filteredContacts.removeWhere((element) => element.id == selectedContactId);
    _contacts.value.removeWhere((element) => element.id == selectedContactId);
    notifyListeners();
  }


}

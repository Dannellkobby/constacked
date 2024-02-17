import 'package:constacked/ui/bottom_sheets/add_contact/add_contact_sheet.dart';
import 'package:constacked/ui/common/app_strings.dart';
import 'package:constacked/ui/common/ui_helpers.dart';
import 'package:constacked/ui/views/contact_list/contact_list_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

// Define the ContactListView class extending StackedView for reactive updates.
class ContactListView extends StackedView<ContactListViewModel> {
  const ContactListView({Key? key}) : super(key: key);

  // Initialize the view model on creation.
  @override
  void onViewModelReady(ContactListViewModel viewModel) {
    viewModel.filterContacts('');
    viewModel.sortContactsAtoZ();
    super.onViewModelReady(viewModel);
  }

  // Build the UI based on the view model's state.
  @override
  Widget builder(
      BuildContext context, ContactListViewModel viewModel, Widget? child) {
    return Scaffold(
      // Define the app bar with title and action button for adding contacts.
      appBar: AppBar(
        leading: const SizedBox.shrink(), // Remove leading widget.
        leadingWidth: kSizeSmall, // Display app name from app_strings.dart.
        title: Text(
          ksAppName,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        actions: [
          TextButton(
            onPressed: () {
              // Open the AddContactSheet using showModalBottomSheet.
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) => AddContactSheet.blank(),
              );
            },
            child: const Row(
              children: [
                Icon(Icons.person_add_alt_outlined, size: kSizeSmall * 1.5),
                Text(' $ksAddNewContact'),
              ],
            ),
          ),
          const SizedBox(width: kSizeMedium / 2)
        ],
      ),
      // Display the body with search bar and contact list.
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(
                horizontal: kSizeSmall, vertical: kSizeSmall),
            height: 40,
            child: TextField(
              onChanged: viewModel.filterContacts,
              controller: viewModel.tecSearchContact,
              focusNode: viewModel.fnSearchContact,
              decoration: InputDecoration(
                filled: true,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: kSizeMedium),
                fillColor: Colors.grey.shade200,
                hintText: ksSearch,
                hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Colors.grey.shade600,
                    ),
                prefixIcon:
                    Icon(Icons.search_rounded, color: Colors.grey.shade600),
                suffixIcon: viewModel.tecSearchContact.value.text.isEmpty
                    ? IconButton(
                        onPressed: viewModel.onPressedIconMic,
                        color: Colors.grey.shade600,
                        icon: const Icon(Icons.mic),
                      )
                    : IconButton(
                        onPressed: viewModel.onPressedIconClear,
                        icon: const Icon(Icons.close),
                        color: Colors.grey.shade600,
                      ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(kSizeSmallest),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          // Expanded list view displaying contacts.
          Expanded(
            child: ListView.separated(
              itemCount: viewModel.filteredContacts.length,
              physics: const BouncingScrollPhysics(),
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              itemBuilder: (context, index) {
                final contact = viewModel.filteredContacts[index];
                return ListTile(
                  dense: true,
                  onTap: () => viewModel.onTapContact(contact.id),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: kSizeMedium * 1.5),
                  title: Text(
                    contact.fullName,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  subtitle: Text(
                    contact.phoneNumber,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.grey.shade600,
                        ),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) => Divider(
                height: 0,
                indent: kSizeMedium,
                color: Colors.grey.shade200,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  ContactListViewModel viewModelBuilder(BuildContext context) =>
      ContactListViewModel();
}

import 'package:constacked/models/contact.dart';
import 'package:constacked/ui/common/app_strings.dart';
import 'package:constacked/ui/common/ui_helpers.dart';
import 'package:constacked/ui/common/validators.dart';
import 'package:constacked/ui/views/contact_details/contact_details_view.form.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'contact_details_viewmodel.dart';

// Annotation for form fields and their validators
@FormView(fields: [
  FormTextField(
      name: 'firstName', validator: ContactFormValidator.validateFirstName),
  FormTextField(
      name: 'lastName', validator: ContactFormValidator.validateLastName),
  FormTextField(
      name: 'phoneNumber', validator: ContactFormValidator.validatePhone),
  FormTextField(name: 'nickname'),
  FormTextField(name: 'relationship'),
  FormTextField(name: 'email', validator: ContactFormValidator.validateEmail),
  FormTextField(name: 'groups'),
  FormTextField(name: 'notes'),
])
class ContactDetailsView extends StackedView<ContactDetailsViewModel>
    with $ContactDetailsView {
  final String? id;

  const ContactDetailsView({required this.id, Key? key}) : super(key: key);

  @override
  void onViewModelReady(ContactDetailsViewModel viewModel) {
    // Set selected contact ID and populate form fields
    viewModel.selectedContactId = '$id';
    final Contact contact = viewModel.contact;
    firstNameController.text = contact.firstName;
    lastNameController.text = contact.lastName;
    phoneNumberController.text = contact.phoneNumber;
    nicknameController.text = '${contact.nickname}';
    relationshipController.text = '${contact.relationship}';
    emailController.text = '${contact.email}';
    groupsController.text = '${contact.groups}';
    notesController.text = '${contact.notes}';
    syncFormWithViewModel(viewModel);
    super.onViewModelReady(viewModel);
  }

  @override
  Widget builder(
    BuildContext context,
    ContactDetailsViewModel viewModel,
    Widget? child,
  ) {
    final Contact contact = viewModel.contact;
    return Scaffold(
      appBar: AppBar(
        // Leading icon for back button
      leading: IconButton(
          icon:  Icon(Icons.keyboard_arrow_left, color: Theme.of(context).colorScheme.primary,),
          onPressed: viewModel.onPressedBack,
        ),
        // Action button to toggle edit mode
        actions: [
          TextButton(
            onPressed: viewModel.toggleEditMode,
            child: Text(viewModel.editMode ? ksDone : ksEditContact),
          ),
          horizontalSpaceSmall
        ],
      ),
      // Body with contact details and form sections
      body: Column(
        children: [
          // Contact name and image section
          Padding(
            padding: const EdgeInsets.all(kSizeLarge),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.person_outline, size: kSizeMedium * 1.2),
                  const SizedBox(width: kSizeSmallest),
                  Text(contact.fullName,
                      style: Theme.of(context).textTheme.headlineMedium),
                ],
              ),
            ),
          ),
          // Expanded scrollable section for form fields
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: kSizeMedium),
                child: Form(
                    key: viewModel.formKey,
                    child: Column(
                  children: [
                    // Build contact fields with labels and conditional rendering based on edit mode
                    _buildContactField(
                      editMode: viewModel.editMode,
                      context: context,
                      validator: ContactFormValidator.validateFirstName,
                      controller: firstNameController,
                      label: ksFirstName,
                    ),
                    _buildContactField(
                      editMode: viewModel.editMode,
                      context: context,
                      validator: ContactFormValidator.validateLastName,
                      controller: lastNameController,
                      label: ksLastName,
                    ),
                    _buildContactField(
                      editMode: viewModel.editMode,
                      context: context,
                      validator: ContactFormValidator.validatePhone,
                      controller: phoneNumberController,
                      label: ksPhone,
                    ),
                    _buildContactField(
                      editMode: viewModel.editMode,
                      context: context,
                      controller: nicknameController,
                      label: ksNickname,
                    ),
                    _buildContactField(
                      editMode: viewModel.editMode,
                      context: context,
                      controller: relationshipController,
                      label: ksRelationship,
                    ),
                    _buildContactField(
                      editMode: viewModel.editMode,
                      context: context,
                      controller: emailController,
                      label: ksEmail,
                      validator: ContactFormValidator.validateEmail,
                    ),
                    _buildContactField(
                      context: context,
                      editMode: viewModel.editMode,
                      controller: groupsController,
                      label: ksGroups,
                    ),
                    _buildContactField(
                      context: context,
                      editMode: viewModel.editMode,
                      controller: notesController,
                      label: ksNotes,
                      minLines: 1,
                      maxLines: 5,
                      textInputAction: TextInputAction.done,
                    ),
                    // Conditionally display delete button only in edit mode
                    if (viewModel.editMode)
                      Align(
                        alignment: Alignment.centerLeft,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            foregroundColor: Theme.of(context).colorScheme.error,
                          ),
                          onPressed: (){
                            // Show confirmation dialog before deleting
                            showDialog(context: context,
                                builder: (context) => AlertDialog(
                              title: const Text(ksDeleteContact),
                              content:  Text('$ksDeleteContactMessage: ${contact.fullName}?'),
                              actions: [
                                TextButton(
                                  onPressed: (){
                                    Navigator.pop(context);
                                  },
                                  child: const Text(ksCancel),
                                ),
                                TextButton(
                                  style: TextButton.styleFrom(
                                    foregroundColor: Theme.of(context).colorScheme.error,
                                  ),
                                  onPressed: (){
                                    Navigator.pop(context);
                                    viewModel.onPressedDelete();

                                  },
                                  child: const Text(ksDeleteContact),
                                ),
                              ],
                            ));

                          },
                          child: const Text(ksDeleteContact),
                        ),
                      ),
                  ],
                )),
              ),
            ),
          )
        ],
      ),
    );
  }

  // Reusable function to build each contact field with styling and validation
  _buildContactField({
    required bool editMode,
    required BuildContext context,
    required TextEditingController controller,
    required String label,
    dynamic validator,
    TextInputAction? textInputAction,
    int? maxLines,
    int? minLines,
  }) {
    var inputDecoration = InputDecoration(
      filled: true,
      enabled: editMode,
      prefix: const SizedBox(width: 96),
      suffix: const SizedBox(width: 8),
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: Colors.grey.shade100,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(kSizeSmallest),
        borderSide:
            BorderSide(color: Theme.of(context).primaryColor.withOpacity(0.2)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(kSizeSmallest),
        borderSide:
            BorderSide(color: Theme.of(context).primaryColor.withOpacity(0.8)),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(kSizeSmallest),
        borderSide: BorderSide.none,
      ),
    );
    return Column(
      children: [
        Stack(
          children: [
            TextFormField(
              textDirection: TextDirection.ltr,
              controller: controller,
              autofocus: true,
              style: editMode? Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.w500
              ):
              Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.black54,
                  fontWeight: FontWeight.w500
              ),
              textAlign: TextAlign.right,
              textInputAction: textInputAction ?? TextInputAction.next,
              textAlignVertical: TextAlignVertical.center,
              textCapitalization: TextCapitalization.words,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: validator,
              decoration: inputDecoration,
              minLines: maxLines,
              maxLines: maxLines,
            ),
            Positioned(
              top: 16,
              bottom: 0,
              left: kSizeMedium,
              child: Text(
                label,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.grey.shade500
                    ),
              ),
            )
          ],
        ),
        verticalSpaceSmall
      ],
    );
  }

  @override
  ContactDetailsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ContactDetailsViewModel();
}

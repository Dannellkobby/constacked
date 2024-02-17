import 'package:constacked/ui/bottom_sheets/add_contact/add_contact_sheet.form.dart';
import 'package:constacked/ui/common/app_strings.dart';
import 'package:constacked/ui/common/validators.dart';
import 'package:flutter/material.dart';
import 'package:constacked/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked/stacked_annotations.dart';
import 'add_contact_sheet_model.dart';

// Defines the AddContactSheet view using Stacked and FormView annotations.
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
// Constructor for opening the sheet with a completer and request.
class AddContactSheet extends StackedView<AddContactSheetModel>
    with $AddContactSheet {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;

  const AddContactSheet({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);

  // Blank constructor for potential alternative uses.
  AddContactSheet.blank({Key? key})
      : completer = null,
        request = SheetRequest(),
        super(key: key);

  @override
  void onViewModelReady(AddContactSheetModel viewModel) {
    // Synchronizes form fields with the view model.
    syncFormWithViewModel(viewModel);
    super.onViewModelReady(viewModel);
  }

  @override
  void onDispose(AddContactSheetModel viewModel) {
    // Disposes of form controllers to avoid memory leaks.
    disposeForm();
    super.onDispose(viewModel);
  }

  @override
  Widget builder(
    BuildContext context,
    AddContactSheetModel viewModel,
    Widget? child,
  ) {
    // Creates input decoration for consistent styling.
    final inputDecoration = InputDecoration(
      filled: true,
      labelStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: Colors.grey.shade600,
          ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(kSizeSmallest),
        borderSide: BorderSide.none,
      ),
    );
    // Builds the sheet's UI structure.
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Form(
        key: viewModel.formKey,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(kSizeMedium),
                  topRight: Radius.circular(kSizeMedium),
                ),
              ),
              padding: const EdgeInsets.all(kSizeMedium),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Icon(Icons.person_add_alt_outlined),
                      Text(' $ksNewContact',
                          style: Theme.of(context).textTheme.titleSmall),
                    ],
                  ),
                  verticalSpaceSmall,
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: SingleChildScrollView(
                      // keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          verticalSpaceSmall,
                          Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  textCapitalization: TextCapitalization.words,
                                  controller: firstNameController,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  validator:
                                      ContactFormValidator.validateFirstName,
                                  decoration: inputDecoration.copyWith(
                                    labelText: ksFirstName,
                                  ),
                                ),
                              ),
                              horizontalSpaceMedium,
                              Expanded(
                                child: TextFormField(
                                  textCapitalization: TextCapitalization.words,
                                  controller: lastNameController,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  validator:
                                      ContactFormValidator.validateLastName,
                                  decoration: inputDecoration.copyWith(
                                    labelText: ksLastName,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          verticalSpaceSmall,
                          TextFormField(
                            textCapitalization: TextCapitalization.words,
                            controller: phoneNumberController,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: ContactFormValidator.validatePhone,
                            decoration: inputDecoration.copyWith(
                              labelText: ksPhone,
                            ),
                          ),
                          verticalSpaceSmall,
                          Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  textCapitalization: TextCapitalization.words,
                                  controller: nicknameController,
                                  decoration: inputDecoration.copyWith(
                                    labelText: ksNickname,
                                  ),
                                ),
                              ),
                              horizontalSpaceMedium,
                              Expanded(
                                child: TextFormField(
                                  textCapitalization: TextCapitalization.words,
                                  controller: relationshipController,
                                  decoration: inputDecoration.copyWith(
                                    labelText: ksRelationship,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          verticalSpaceSmall,
                          TextFormField(
                            controller: emailController,
                            textCapitalization: TextCapitalization.words,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: ContactFormValidator.validateEmail,
                            decoration: inputDecoration.copyWith(
                              labelText: ksEmail,
                            ),
                          ),
                          verticalSpaceSmall,
                          TextFormField(
                            controller: groupsController,
                            textCapitalization: TextCapitalization.words,
                            decoration: inputDecoration.copyWith(
                              labelText: ksGroups,
                            ),
                          ),
                          verticalSpaceSmall,
                          TextFormField(
                            minLines: 3,
                            maxLines: 5,
                            textCapitalization: TextCapitalization.sentences,
                            controller: notesController,
                            decoration: inputDecoration.copyWith(
                              labelText: ksNotes,
                            ),
                          ),
                          verticalSpaceSmall,
                        ],
                      ),
                    ),
                  ),
                  verticalSpaceSmall,
                  ElevatedButton(
                    onPressed: viewModel.onPressedAddContact,
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Theme.of(context).colorScheme.primaryContainer),
                      overlayColor: MaterialStateProperty.all(Theme.of(context)
                          .colorScheme
                          .background
                          .withOpacity(0.3)),
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                    ),
                    child: const Text(ksAddContact),
                  ),
                ],
              ),
            ),
            Positioned(
              right: 10,
              top: 10,
              child: IconButton(
                  color: Colors.grey.shade600,
                  iconSize: kSizeSmall * 1.5,
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.grey.shade100),
                  ),
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close)),
            ),
          ],
        ),
      ),
    );
  }

  @override
  AddContactSheetModel viewModelBuilder(BuildContext context) =>
      AddContactSheetModel();
}

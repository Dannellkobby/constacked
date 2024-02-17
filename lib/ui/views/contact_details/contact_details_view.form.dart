// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:constacked/ui/common/validators.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const bool _autoTextFieldValidation = true;

const String FirstNameValueKey = 'firstName';
const String LastNameValueKey = 'lastName';
const String PhoneNumberValueKey = 'phoneNumber';
const String NicknameValueKey = 'nickname';
const String RelationshipValueKey = 'relationship';
const String EmailValueKey = 'email';
const String GroupsValueKey = 'groups';
const String NotesValueKey = 'notes';

final Map<String, TextEditingController>
    _ContactDetailsViewTextEditingControllers = {};

final Map<String, FocusNode> _ContactDetailsViewFocusNodes = {};

final Map<String, String? Function(String?)?>
    _ContactDetailsViewTextValidations = {
  FirstNameValueKey: ContactFormValidator.validateFirstName,
  LastNameValueKey: ContactFormValidator.validateLastName,
  PhoneNumberValueKey: ContactFormValidator.validatePhone,
  NicknameValueKey: null,
  RelationshipValueKey: null,
  EmailValueKey: ContactFormValidator.validateEmail,
  GroupsValueKey: null,
  NotesValueKey: null,
};

mixin $ContactDetailsView {
  TextEditingController get firstNameController =>
      _getFormTextEditingController(FirstNameValueKey);
  TextEditingController get lastNameController =>
      _getFormTextEditingController(LastNameValueKey);
  TextEditingController get phoneNumberController =>
      _getFormTextEditingController(PhoneNumberValueKey);
  TextEditingController get nicknameController =>
      _getFormTextEditingController(NicknameValueKey);
  TextEditingController get relationshipController =>
      _getFormTextEditingController(RelationshipValueKey);
  TextEditingController get emailController =>
      _getFormTextEditingController(EmailValueKey);
  TextEditingController get groupsController =>
      _getFormTextEditingController(GroupsValueKey);
  TextEditingController get notesController =>
      _getFormTextEditingController(NotesValueKey);

  FocusNode get firstNameFocusNode => _getFormFocusNode(FirstNameValueKey);
  FocusNode get lastNameFocusNode => _getFormFocusNode(LastNameValueKey);
  FocusNode get phoneNumberFocusNode => _getFormFocusNode(PhoneNumberValueKey);
  FocusNode get nicknameFocusNode => _getFormFocusNode(NicknameValueKey);
  FocusNode get relationshipFocusNode =>
      _getFormFocusNode(RelationshipValueKey);
  FocusNode get emailFocusNode => _getFormFocusNode(EmailValueKey);
  FocusNode get groupsFocusNode => _getFormFocusNode(GroupsValueKey);
  FocusNode get notesFocusNode => _getFormFocusNode(NotesValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_ContactDetailsViewTextEditingControllers.containsKey(key)) {
      return _ContactDetailsViewTextEditingControllers[key]!;
    }

    _ContactDetailsViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _ContactDetailsViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_ContactDetailsViewFocusNodes.containsKey(key)) {
      return _ContactDetailsViewFocusNodes[key]!;
    }
    _ContactDetailsViewFocusNodes[key] = FocusNode();
    return _ContactDetailsViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormStateHelper model) {
    firstNameController.addListener(() => _updateFormData(model));
    lastNameController.addListener(() => _updateFormData(model));
    phoneNumberController.addListener(() => _updateFormData(model));
    nicknameController.addListener(() => _updateFormData(model));
    relationshipController.addListener(() => _updateFormData(model));
    emailController.addListener(() => _updateFormData(model));
    groupsController.addListener(() => _updateFormData(model));
    notesController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    firstNameController.addListener(() => _updateFormData(model));
    lastNameController.addListener(() => _updateFormData(model));
    phoneNumberController.addListener(() => _updateFormData(model));
    nicknameController.addListener(() => _updateFormData(model));
    relationshipController.addListener(() => _updateFormData(model));
    emailController.addListener(() => _updateFormData(model));
    groupsController.addListener(() => _updateFormData(model));
    notesController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormStateHelper model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          FirstNameValueKey: firstNameController.text,
          LastNameValueKey: lastNameController.text,
          PhoneNumberValueKey: phoneNumberController.text,
          NicknameValueKey: nicknameController.text,
          RelationshipValueKey: relationshipController.text,
          EmailValueKey: emailController.text,
          GroupsValueKey: groupsController.text,
          NotesValueKey: notesController.text,
        }),
    );

    if (_autoTextFieldValidation || forceValidate) {
      updateValidationData(model);
    }
  }

  bool validateFormFields(FormViewModel model) {
    _updateFormData(model, forceValidate: true);
    return model.isFormValid;
  }

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    for (var controller in _ContactDetailsViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _ContactDetailsViewFocusNodes.values) {
      focusNode.dispose();
    }

    _ContactDetailsViewTextEditingControllers.clear();
    _ContactDetailsViewFocusNodes.clear();
  }
}

extension ValueProperties on FormStateHelper {
  bool get hasAnyValidationMessage => this
      .fieldsValidationMessages
      .values
      .any((validation) => validation != null);

  bool get isFormValid {
    if (!_autoTextFieldValidation) this.validateForm();

    return !hasAnyValidationMessage;
  }

  String? get firstNameValue => this.formValueMap[FirstNameValueKey] as String?;
  String? get lastNameValue => this.formValueMap[LastNameValueKey] as String?;
  String? get phoneNumberValue =>
      this.formValueMap[PhoneNumberValueKey] as String?;
  String? get nicknameValue => this.formValueMap[NicknameValueKey] as String?;
  String? get relationshipValue =>
      this.formValueMap[RelationshipValueKey] as String?;
  String? get emailValue => this.formValueMap[EmailValueKey] as String?;
  String? get groupsValue => this.formValueMap[GroupsValueKey] as String?;
  String? get notesValue => this.formValueMap[NotesValueKey] as String?;

  set firstNameValue(String? value) {
    this.setData(
      this.formValueMap..addAll({FirstNameValueKey: value}),
    );

    if (_ContactDetailsViewTextEditingControllers.containsKey(
        FirstNameValueKey)) {
      _ContactDetailsViewTextEditingControllers[FirstNameValueKey]?.text =
          value ?? '';
    }
  }

  set lastNameValue(String? value) {
    this.setData(
      this.formValueMap..addAll({LastNameValueKey: value}),
    );

    if (_ContactDetailsViewTextEditingControllers.containsKey(
        LastNameValueKey)) {
      _ContactDetailsViewTextEditingControllers[LastNameValueKey]?.text =
          value ?? '';
    }
  }

  set phoneNumberValue(String? value) {
    this.setData(
      this.formValueMap..addAll({PhoneNumberValueKey: value}),
    );

    if (_ContactDetailsViewTextEditingControllers.containsKey(
        PhoneNumberValueKey)) {
      _ContactDetailsViewTextEditingControllers[PhoneNumberValueKey]?.text =
          value ?? '';
    }
  }

  set nicknameValue(String? value) {
    this.setData(
      this.formValueMap..addAll({NicknameValueKey: value}),
    );

    if (_ContactDetailsViewTextEditingControllers.containsKey(
        NicknameValueKey)) {
      _ContactDetailsViewTextEditingControllers[NicknameValueKey]?.text =
          value ?? '';
    }
  }

  set relationshipValue(String? value) {
    this.setData(
      this.formValueMap..addAll({RelationshipValueKey: value}),
    );

    if (_ContactDetailsViewTextEditingControllers.containsKey(
        RelationshipValueKey)) {
      _ContactDetailsViewTextEditingControllers[RelationshipValueKey]?.text =
          value ?? '';
    }
  }

  set emailValue(String? value) {
    this.setData(
      this.formValueMap..addAll({EmailValueKey: value}),
    );

    if (_ContactDetailsViewTextEditingControllers.containsKey(EmailValueKey)) {
      _ContactDetailsViewTextEditingControllers[EmailValueKey]?.text =
          value ?? '';
    }
  }

  set groupsValue(String? value) {
    this.setData(
      this.formValueMap..addAll({GroupsValueKey: value}),
    );

    if (_ContactDetailsViewTextEditingControllers.containsKey(GroupsValueKey)) {
      _ContactDetailsViewTextEditingControllers[GroupsValueKey]?.text =
          value ?? '';
    }
  }

  set notesValue(String? value) {
    this.setData(
      this.formValueMap..addAll({NotesValueKey: value}),
    );

    if (_ContactDetailsViewTextEditingControllers.containsKey(NotesValueKey)) {
      _ContactDetailsViewTextEditingControllers[NotesValueKey]?.text =
          value ?? '';
    }
  }

  bool get hasFirstName =>
      this.formValueMap.containsKey(FirstNameValueKey) &&
      (firstNameValue?.isNotEmpty ?? false);
  bool get hasLastName =>
      this.formValueMap.containsKey(LastNameValueKey) &&
      (lastNameValue?.isNotEmpty ?? false);
  bool get hasPhoneNumber =>
      this.formValueMap.containsKey(PhoneNumberValueKey) &&
      (phoneNumberValue?.isNotEmpty ?? false);
  bool get hasNickname =>
      this.formValueMap.containsKey(NicknameValueKey) &&
      (nicknameValue?.isNotEmpty ?? false);
  bool get hasRelationship =>
      this.formValueMap.containsKey(RelationshipValueKey) &&
      (relationshipValue?.isNotEmpty ?? false);
  bool get hasEmail =>
      this.formValueMap.containsKey(EmailValueKey) &&
      (emailValue?.isNotEmpty ?? false);
  bool get hasGroups =>
      this.formValueMap.containsKey(GroupsValueKey) &&
      (groupsValue?.isNotEmpty ?? false);
  bool get hasNotes =>
      this.formValueMap.containsKey(NotesValueKey) &&
      (notesValue?.isNotEmpty ?? false);

  bool get hasFirstNameValidationMessage =>
      this.fieldsValidationMessages[FirstNameValueKey]?.isNotEmpty ?? false;
  bool get hasLastNameValidationMessage =>
      this.fieldsValidationMessages[LastNameValueKey]?.isNotEmpty ?? false;
  bool get hasPhoneNumberValidationMessage =>
      this.fieldsValidationMessages[PhoneNumberValueKey]?.isNotEmpty ?? false;
  bool get hasNicknameValidationMessage =>
      this.fieldsValidationMessages[NicknameValueKey]?.isNotEmpty ?? false;
  bool get hasRelationshipValidationMessage =>
      this.fieldsValidationMessages[RelationshipValueKey]?.isNotEmpty ?? false;
  bool get hasEmailValidationMessage =>
      this.fieldsValidationMessages[EmailValueKey]?.isNotEmpty ?? false;
  bool get hasGroupsValidationMessage =>
      this.fieldsValidationMessages[GroupsValueKey]?.isNotEmpty ?? false;
  bool get hasNotesValidationMessage =>
      this.fieldsValidationMessages[NotesValueKey]?.isNotEmpty ?? false;

  String? get firstNameValidationMessage =>
      this.fieldsValidationMessages[FirstNameValueKey];
  String? get lastNameValidationMessage =>
      this.fieldsValidationMessages[LastNameValueKey];
  String? get phoneNumberValidationMessage =>
      this.fieldsValidationMessages[PhoneNumberValueKey];
  String? get nicknameValidationMessage =>
      this.fieldsValidationMessages[NicknameValueKey];
  String? get relationshipValidationMessage =>
      this.fieldsValidationMessages[RelationshipValueKey];
  String? get emailValidationMessage =>
      this.fieldsValidationMessages[EmailValueKey];
  String? get groupsValidationMessage =>
      this.fieldsValidationMessages[GroupsValueKey];
  String? get notesValidationMessage =>
      this.fieldsValidationMessages[NotesValueKey];
}

extension Methods on FormStateHelper {
  setFirstNameValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[FirstNameValueKey] = validationMessage;
  setLastNameValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[LastNameValueKey] = validationMessage;
  setPhoneNumberValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[PhoneNumberValueKey] = validationMessage;
  setNicknameValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[NicknameValueKey] = validationMessage;
  setRelationshipValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[RelationshipValueKey] = validationMessage;
  setEmailValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[EmailValueKey] = validationMessage;
  setGroupsValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[GroupsValueKey] = validationMessage;
  setNotesValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[NotesValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    firstNameValue = '';
    lastNameValue = '';
    phoneNumberValue = '';
    nicknameValue = '';
    relationshipValue = '';
    emailValue = '';
    groupsValue = '';
    notesValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      FirstNameValueKey: getValidationMessage(FirstNameValueKey),
      LastNameValueKey: getValidationMessage(LastNameValueKey),
      PhoneNumberValueKey: getValidationMessage(PhoneNumberValueKey),
      NicknameValueKey: getValidationMessage(NicknameValueKey),
      RelationshipValueKey: getValidationMessage(RelationshipValueKey),
      EmailValueKey: getValidationMessage(EmailValueKey),
      GroupsValueKey: getValidationMessage(GroupsValueKey),
      NotesValueKey: getValidationMessage(NotesValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _ContactDetailsViewTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _ContactDetailsViewTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormStateHelper model) =>
    model.setValidationMessages({
      FirstNameValueKey: getValidationMessage(FirstNameValueKey),
      LastNameValueKey: getValidationMessage(LastNameValueKey),
      PhoneNumberValueKey: getValidationMessage(PhoneNumberValueKey),
      NicknameValueKey: getValidationMessage(NicknameValueKey),
      RelationshipValueKey: getValidationMessage(RelationshipValueKey),
      EmailValueKey: getValidationMessage(EmailValueKey),
      GroupsValueKey: getValidationMessage(GroupsValueKey),
      NotesValueKey: getValidationMessage(NotesValueKey),
    });

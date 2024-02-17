import 'dart:math';

import 'package:constacked/models/person.dart';
import 'package:hive_flutter/hive_flutter.dart';

// Defines the Contact model, extending Person and using Hive for storage.
@HiveType(typeId: 1) // Registers the model with Hive using a unique type ID.
class Contact extends Person {
  @HiveField(2) // Specifies the field order for Hive storage.
  String? id;

  @HiveField(3)
  String phoneNumber;

  @HiveField(4)
  String? nickname;

  @HiveField(5)
  String? email;

  @HiveField(6)
  String? groups;

  @HiveField(7)
  String? notes;

  @HiveField(8)
  String? relationship;

  // Contact constructor, ensuring a unique ID is generated if not provided.
  Contact({
    required super.firstName,
    required super.lastName,
    this.id,
    required this.phoneNumber,
    this.nickname,
    this.email,
    this.groups,
    this.notes,
    this.relationship,
  }) {
    id ??= generateId();
  }

  // Generates a unique ID based on timestamp and random number.
  String generateId() {
    final now = DateTime.now();
    final random = Random();
    final id = "${now.millisecondsSinceEpoch}-${random.nextInt(100000000)}";
    return id;
  }

  // Overrides the toString method for meaningful string representation.
  @override
  String toString() {
    return 'Contact {id: $id, firstName: $firstName, lastName: $lastName, phoneNumber: $phoneNumber, nickname: $nickname, email: $email, groups: $groups, notes: $notes, relationship: $relationship}';
  }
}

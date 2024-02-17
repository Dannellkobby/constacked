import 'package:hive_flutter/hive_flutter.dart';

@HiveType(typeId: 0)
class Person extends HiveObject {
  @HiveField(0)
  String firstName;

  @HiveField(1)
  String lastName;

  // constructor
  Person({required this.firstName, required this.lastName});

  // the full name of the person
  String get fullName => '$firstName $lastName';
}

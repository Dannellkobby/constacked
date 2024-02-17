import 'package:constacked/models/contact.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ContactAdapter extends TypeAdapter<Contact> {
  @override
  final int typeId = 1;

  @override
  Contact read(BinaryReader reader) {
    return Contact(
      firstName: reader.readString(),
      lastName: reader.readString(),
      id: reader.readString(),
      phoneNumber: reader.readString(),
      notes: reader.read(),
      email: reader.read(),
      nickname: reader.read(),
      relationship: reader.read(),
      groups: reader.read(),
    );
  }

  @override
  void write(BinaryWriter writer, Contact obj) {
    writer.writeString(obj.firstName);
    writer.writeString(obj.lastName);
    writer.writeString(obj.id??'');
    writer.writeString(obj.phoneNumber);
    writer.write(obj.notes);
    writer.write(obj.email);
    writer.write(obj.nickname);
    writer.write(obj.relationship);
    writer.write(obj.groups);
  }
}

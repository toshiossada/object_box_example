import 'package:diacritic/diacritic.dart';
import 'package:object_box/objectbox.g.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class PersonModel {
  int id;

  String firstName;
  String lastName;
  String fullNameWithoutDiatrics;

  PersonModel({this.id = 0, required this.firstName, required this.lastName})
      : fullNameWithoutDiatrics = removeDiacritics('$firstName $lastName');
}

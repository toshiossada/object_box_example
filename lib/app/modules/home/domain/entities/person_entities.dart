class PersonEntity {
  int id;

  String firstName;
  String lastName;

  String get fullName => '$firstName $lastName';

  PersonEntity({
    this.id = 0,
    required this.firstName,
    required this.lastName,
  });
}

import '../entities/person_entities.dart';

abstract class IPersonRepository {
  Future<PersonEntity?> get(int id);
  Future<List<PersonEntity>> list();
  Future<List<PersonEntity>> find(String name);
  Future<int> insert(PersonEntity person);
}

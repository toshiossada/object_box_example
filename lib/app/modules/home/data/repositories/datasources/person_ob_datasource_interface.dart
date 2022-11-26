import '../models/person_model.dart';

abstract class IPersonObDatasource {
  Future<List<PersonModel>> find({String? name});
  Future<bool> remove(int id);
  Future<PersonModel?> get(int id);
  Future<int> put(PersonModel person);
}

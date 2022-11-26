import '../../domain/entities/person_entities.dart';
import '../../domain/repositories/person_repository_interface.dart';
import 'datasources/person_ob_datasource_interface.dart';
import 'mappers/base_mapper.dart';
import 'models/person_model.dart';

class PersonRepository implements IPersonRepository {
  final IPersonObDatasource datasource;
  final IMapper<PersonEntity, PersonModel> mapper;

  PersonRepository({
    required this.datasource,
    required this.mapper,
  });

  @override
  Future<PersonEntity?> get(int id) async {
    final result = await datasource.get(id);

    return result == null ? null : mapper.toEntity(result);
  }

  @override
  Future<List<PersonEntity>> find(String name) async {
    final result = await datasource.find(name: name);

    return result.map((e) => mapper.toEntity(e)).toList();
  }

  @override
  Future<int> insert(PersonEntity person) async {
    final result = await datasource.put(mapper.toModel(person));

    return result;
  }

  @override
  Future<List<PersonEntity>> list() async {
    final result = await datasource.find();

    return result.map((e) => mapper.toEntity(e)).toList();
  }
}

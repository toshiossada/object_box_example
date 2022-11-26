import 'package:object_box/app/modules/home/domain/entities/person_entities.dart';

import '../repositories/person_repository_interface.dart';

class FindPeopleUsecase {
  final IPersonRepository repository;

  FindPeopleUsecase({required this.repository});
  Future<List<PersonEntity>> call(String name) async {
    final result = await repository.find(name);

    return result;
  }
}

import 'package:object_box/app/modules/home/domain/entities/person_entities.dart';

import '../repositories/person_repository_interface.dart';

class ListAllPeopleUsecase {
  final IPersonRepository repository;

  ListAllPeopleUsecase({required this.repository});
  Future<List<PersonEntity>> call() async {
    final result = await repository.list();

    return result;
  }
}

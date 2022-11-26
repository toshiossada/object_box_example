import '../entities/person_entities.dart';
import '../repositories/person_repository_interface.dart';

class InsertPersonUsecas {
  final IPersonRepository repository;

  InsertPersonUsecas({required this.repository});
  Future<void> call() async {
    final list = [
      PersonEntity(lastName: 'çouza', firstName: 'caio'),
      PersonEntity(lastName: 'úban', firstName: 'çaio'),
      PersonEntity(lastName: 'íôn', firstName: 'caió'),
    ];

    await Future.wait(list.map((e) => repository.insert(e)));
  }
}

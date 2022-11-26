import 'package:diacritic/diacritic.dart';
import 'package:object_box/app/modules/home/data/repositories/models/person_model.dart';
import 'package:object_box/objectbox.g.dart';

import '../../../../../../commons/local_db.dart';
import '../../repositories/datasources/person_ob_datasource_interface.dart';

class PersonObDatasource implements IPersonObDatasource {
  LocalDb localDb;
  PersonObDatasource({required this.localDb});

  @override
  Future<List<PersonModel>> find({String? name}) async {
    final store = await localDb.completer.future;
    final box = store.box<PersonModel>();

    final query = box
        .query(PersonModel_.fullNameWithoutDiatrics
            .contains(removeDiacritics(name ?? '')))
        .build();
    final people = query.find();

    return people;
  }

  @override
  Future<bool> remove(int id) async {
    final store = await localDb.completer.future;
    final box = store.box<PersonModel>();
    return box.remove(id);
  }

  @override
  Future<PersonModel?> get(int id) async {
    final store = await localDb.completer.future;
    final box = store.box<PersonModel>();
    return box.get(id);
  }

  @override
  Future<int> put(PersonModel person) async {
    final store = await localDb.completer.future;
    final box = store.box<PersonModel>();
    return box.put(person);
  }
}

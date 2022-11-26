import 'package:object_box/app/modules/home/data/repositories/mappers/base_mapper.dart';
import 'package:object_box/app/modules/home/data/repositories/models/person_model.dart';
import 'package:object_box/app/modules/home/domain/entities/person_entities.dart';

class PersonMapper implements IMapper<PersonEntity, PersonModel> {
  @override
  PersonEntity toEntity(PersonModel model) {
    return PersonEntity(
      id: model.id,
      firstName: model.firstName,
      lastName: model.lastName,
    );
  }

  @override
  PersonModel toModel(PersonEntity entity) {
    return PersonModel(
      id: entity.id,
      firstName: entity.firstName,
      lastName: entity.lastName,
    );
  }
}

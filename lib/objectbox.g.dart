// GENERATED CODE - DO NOT MODIFY BY HAND
// This code was generated by ObjectBox. To update it run the generator again:
// With a Flutter package, run `flutter pub run build_runner build`.
// With a Dart package, run `dart run build_runner build`.
// See also https://docs.objectbox.io/getting-started#generate-objectbox-code

// ignore_for_file: camel_case_types
// coverage:ignore-file
// ignore_for_file: depend_on_referenced_packages

import 'dart:typed_data';

import 'package:flat_buffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart';

import 'app/modules/home/data/repositories/models/person_model.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <ModelEntity>[
  ModelEntity(
      id: const IdUid(1, 2463051330060898822),
      name: 'PersonModel',
      lastPropertyId: const IdUid(5, 8846779243699162191),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 869399838153925522),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 5226823235996378383),
            name: 'firstName',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 8164835204843016498),
            name: 'lastName',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 8846779243699162191),
            name: 'fullNameWithoutDiatrics',
            type: 9,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[])
];

/// Open an ObjectBox store with the model declared in this file.
Store openStore(
        {String? directory,
        int? maxDBSizeInKB,
        int? fileMode,
        int? maxReaders,
        bool queriesCaseSensitiveDefault = true,
        String? macosApplicationGroup}) =>
    Store(getObjectBoxModel(),
        directory: directory,
        maxDBSizeInKB: maxDBSizeInKB,
        fileMode: fileMode,
        maxReaders: maxReaders,
        queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
        macosApplicationGroup: macosApplicationGroup);

/// ObjectBox model definition, pass it to [Store] - Store(getObjectBoxModel())
ModelDefinition getObjectBoxModel() {
  final model = ModelInfo(
      entities: _entities,
      lastEntityId: const IdUid(1, 2463051330060898822),
      lastIndexId: const IdUid(0, 0),
      lastRelationId: const IdUid(0, 0),
      lastSequenceId: const IdUid(0, 0),
      retiredEntityUids: const [],
      retiredIndexUids: const [],
      retiredPropertyUids: const [6473768568178525135],
      retiredRelationUids: const [],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, EntityDefinition>{
    PersonModel: EntityDefinition<PersonModel>(
        model: _entities[0],
        toOneRelations: (PersonModel object) => [],
        toManyRelations: (PersonModel object) => {},
        getId: (PersonModel object) => object.id,
        setId: (PersonModel object, int id) {
          object.id = id;
        },
        objectToFB: (PersonModel object, fb.Builder fbb) {
          final firstNameOffset = fbb.writeString(object.firstName);
          final lastNameOffset = fbb.writeString(object.lastName);
          final fullNameWithoutDiatricsOffset =
              fbb.writeString(object.fullNameWithoutDiatrics);
          fbb.startTable(6);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, firstNameOffset);
          fbb.addOffset(2, lastNameOffset);
          fbb.addOffset(4, fullNameWithoutDiatricsOffset);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = PersonModel(
              id: const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0),
              firstName: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 6, ''),
              lastName: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 8, ''))
            ..fullNameWithoutDiatrics =
                const fb.StringReader(asciiOptimization: true)
                    .vTableGet(buffer, rootOffset, 12, '');

          return object;
        })
  };

  return ModelDefinition(model, bindings);
}

/// [PersonModel] entity fields to define ObjectBox queries.
class PersonModel_ {
  /// see [PersonModel.id]
  static final id =
      QueryIntegerProperty<PersonModel>(_entities[0].properties[0]);

  /// see [PersonModel.firstName]
  static final firstName =
      QueryStringProperty<PersonModel>(_entities[0].properties[1]);

  /// see [PersonModel.lastName]
  static final lastName =
      QueryStringProperty<PersonModel>(_entities[0].properties[2]);

  /// see [PersonModel.fullNameWithoutDiatrics]
  static final fullNameWithoutDiatrics =
      QueryStringProperty<PersonModel>(_entities[0].properties[3]);
}
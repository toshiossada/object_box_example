import 'package:flutter_modular/flutter_modular.dart';

import 'data/datasources/internal/person_ob_datasource.dart';
import 'data/repositories/datasources/person_ob_datasource_interface.dart';
import 'data/repositories/mappers/base_mapper.dart';
import 'data/repositories/mappers/person_mapper.dart';
import 'data/repositories/models/person_model.dart';
import 'data/repositories/person_repository.dart';
import 'domain/entities/person_entities.dart';
import 'domain/repositories/person_repository_interface.dart';
import 'domain/usecases/find_people_usecase.dart';
import 'domain/usecases/insert_person_usecase.dart';
import 'domain/usecases/list_all_people_usecase.dart';
import 'presentation/pages/home/home_controller.dart';
import 'presentation/pages/home/home_page.dart';
import 'presentation/pages/home/home_store.dart';
import 'presentation/pages/splash/splash_controller.dart';
import 'presentation/pages/splash/splash_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => HomeStore()),
    Bind.factory((i) => HomeController(
          findPeopleUsecase: i(),
          listAllPeopleUsecase: i(),
          store: i(),
        )),
    Bind.factory((i) => SplashController(insertPersonUsecas: i())),
    Bind.factory<IPersonObDatasource>((i) => PersonObDatasource(localDb: i())),
    Bind.factory<IMapper<PersonEntity, PersonModel>>((i) => PersonMapper()),
    Bind.factory<IPersonRepository>((i) => PersonRepository(
          datasource: i(),
          mapper: i(),
        )),
    Bind.factory((i) => InsertPersonUsecas(repository: i())),
    Bind.factory((i) => ListAllPeopleUsecase(repository: i())),
    Bind.factory((i) => FindPeopleUsecase(repository: i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute,
        child: (_, args) => SplashPage(
              controller: Modular.get(),
            )),
    ChildRoute('/home',
        child: (_, args) => HomePage(
              controller: Modular.get(),
            )),
  ];
}

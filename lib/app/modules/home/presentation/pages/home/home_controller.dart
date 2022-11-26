import 'package:flutter/widgets.dart';

import '../../../domain/usecases/find_people_usecase.dart';
import '../../../domain/usecases/list_all_people_usecase.dart';
import 'home_store.dart';

class HomeController {
  final ListAllPeopleUsecase listAllPeopleUsecase;
  final FindPeopleUsecase findPeopleUsecase;
  final HomeStore store;
  final txtSearch = TextEditingController();

  HomeController({
    required this.listAllPeopleUsecase,
    required this.findPeopleUsecase,
    required this.store,
  });

  init() async {
    store.setLoading(true);
    await Future.delayed(const Duration(seconds: 1));
    final result = await listAllPeopleUsecase();
    store.setListPeople(result);
    store.setLoading(false);
  }

  search(String value) async {
    store.setLoading(true);
    await Future.delayed(const Duration(seconds: 1));
    final result = await findPeopleUsecase(value);
    store.setListPeople(result);
    store.setLoading(false);
  }
}

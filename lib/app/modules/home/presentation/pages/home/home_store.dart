import 'package:flutter/cupertino.dart';

import '../../../domain/entities/person_entities.dart';

class HomeStore extends ChangeNotifier {
  var listPeople = <PersonEntity>[];
  var loading = false;
  HomeStore();

  void setListPeople(List<PersonEntity> list) {
    listPeople = list;
    notifyListeners();
  }

  void setLoading(bool v) {
    loading = v;
    notifyListeners();
  }
}

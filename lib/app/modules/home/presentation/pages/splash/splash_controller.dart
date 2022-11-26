import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../domain/usecases/insert_person_usecase.dart';

class SplashController {
  final InsertPersonUsecas insertPersonUsecas;

  SplashController({required this.insertPersonUsecas});
  init() async {
    await insertPersonUsecas();

    Modular.to.pushReplacementNamed('/home');
  }
}

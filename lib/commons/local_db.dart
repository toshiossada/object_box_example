import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';

import '../../../../../objectbox.g.dart';
import 'app_env.dart';

class LocalDb {
  LocalDb() {
    init();
  }

  final defaultDbSize = 10 * 1024 * 1024;
  final Completer<Store> completer = Completer<Store>();
  Store? _storageDb;
  Admin? _admin;

  Future<Store> init() async {
    if (_storageDb == null || _storageDb!.isClosed()) {
      _clearStore();

      var dir = await getApplicationDocumentsDirectory();

      try {
        _storageDb = Store(
          getObjectBoxModel(),
          directory: '${dir.path}/objectbox',
          maxDBSizeInKB: defaultDbSize,
        ); //UP TO 10GB

        if (kDebugMode &&
            AppEnv.debugDB &&
            _admin == null &&
            Admin.isAvailable()) {
          // Keep a refer ence until no longer needed or manually closed.
          _admin = Admin(_storageDb!);
        }

        completer.complete(_storageDb);
      } catch (e) {
        if (e is ObjectBoxException &&
            e.message.startsWith('failed to create store')) {
          await clearAllFilesAsync();
        }

        rethrow;
      }
    }

    return completer.future;
  }

  _clearStore() {
    _storageDb = null;
    _admin = null;
  }

  clearAllFilesAsync() async {
    _storageDb?.close();
    var dir = await getApplicationDocumentsDirectory();
    Directory('${dir.path}/objectbox').deleteSync(recursive: true);

    _clearStore();

    await init();
  }
}

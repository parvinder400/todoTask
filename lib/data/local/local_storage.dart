import 'dart:convert' as convert;

import 'package:get_storage/get_storage.dart';

abstract class LocalStorage {
  write(String key, dynamic json);
  read<S>(String key, {S Function(Map<String, dynamic>)? construct});
  remove(String key);
  removeAll();
}

class LocalStorageImpl implements LocalStorage {
  late GetStorage storage;

  LocalStorageImpl() {
    _init();
  }

  _init() {
    storage = GetStorage();
    print(storage.getValues());
    print('Storage initialized');
  }

  @override
  write(String key, dynamic value) {
    storage.write(key, convert.jsonEncode(value));
    storage.save();
  }

  @override
  read<S>(String key, {S Function(Map<String, dynamic>)? construct}) {
    String? value = storage.read(key);

    if (value == null) return;

    if (construct == null) return convert.jsonDecode(value);

    Map<String, dynamic> json = convert.jsonDecode(value);

    return construct(json);
  }

  @override
  remove(String key) {
    storage.remove(key);
  }

  @override
  removeAll() {
    throw UnimplementedError();
  }
}

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_crud/data/dummy_users.dart';
import 'package:flutter_crud/models/user.dart';

class Users with ChangeNotifier {
  final Map<String, User> _items = {...dummyUsers};

  List<User> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  User byIndex(int i) {
    return _items.values.elementAt(i);
  }

  void put(User user) {
    // if (user == null) {
    //   return;
    // }

    if (user.id.trim().isNotEmpty && _items.containsKey(user.id)) {
      _items.update(
        user.id,
        (_) => User(
          id: user.id,
          name: user.name,
          email: user.email,
          avatarUrl: user.avatarUrl,
        ),
      );
    } else {
      final id = Random().nextDouble().toString();
      final newUser = User(
        id: id,
        name: user.name,
        email: user.email,
        avatarUrl: user.avatarUrl,
      );
      _items.putIfAbsent(id, () => newUser);
    }

    notifyListeners();
  }

  void remove(User user) {
    _items.remove(user.id);
    notifyListeners();
  }
}

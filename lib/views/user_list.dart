import 'package:flutter/material.dart';
import 'package:flutter_crud/components/user_tile.dart';
import 'package:flutter_crud/routes/app_routes.dart';
import 'package:provider/provider.dart';
import '../provider/users.dart';

class UserList extends StatelessWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final users = Provider.of<Users>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Usuários'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add_circle),
            onPressed: () {
              Navigator.of(context).pushNamed(
                AppRoutes.userForm,
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: users.count,
        itemBuilder: (ctx, i) => UserTile(users.byIndex(i)),
      ),
    );
  }
}

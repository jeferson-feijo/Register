import 'package:flutter/material.dart';
import 'package:flutter_crud/models/user.dart';
import 'package:flutter_crud/provider/users.dart';
import 'package:provider/provider.dart';
import '../routes/app_routes.dart';

class UserTile extends StatelessWidget {
  final User user;

  const UserTile(this.user, {super.key});

  @override
  Widget build(BuildContext context) {
// ListTile possui as posições: leading, title, subtitle, trailing.

    final avatar = user.avatarUrl.isEmpty
        ? const CircleAvatar(child: Icon(Icons.person))
        : CircleAvatar(backgroundImage: NetworkImage(user.avatarUrl));
    return ListTile(
      leading: avatar,
      title: Text(user.name),
      subtitle: Text(user.email),
      trailing: SizedBox(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.edit),
              color: Colors.orange,
              onPressed: () {
                Navigator.of(context).pushNamed(
                  AppRoutes.userForm,
                  arguments: user,
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.delete),
              color: Colors.red,
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: const Text('Excluir Usuário:'),
                    content: const Text('Tem certeza???'),
                    actions: <Widget>[
                      TextButton(
                        child: const Text('Não'),
                        onPressed: () {
                          Navigator.of(context).pop();
                          // pop vai fechar o dialog.
                        },
                      ),
                      TextButton(
                        child: const Text('Sim'),
                        onPressed: () {
                          Provider.of<Users>(context, listen: false)
                              .remove(user);
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                ); /*.then(
                  (confirmed) {
                    if (confirmed) {
                      Provider.of<Users>(context, listen: false).remove(user);
                    }
                  },
                ); */
              },
            ),
          ],
        ),
      ),
    );
  }
}

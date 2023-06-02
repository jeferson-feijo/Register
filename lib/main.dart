import 'package:flutter/material.dart';
import 'package:flutter_crud/provider/users.dart';
import 'package:flutter_crud/routes/app_routes.dart';
import 'package:flutter_crud/views/user_form.dart';
import 'package:flutter_crud/views/user_list.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
// Este Widget é a raiz do seu aplicativo.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Users(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Cadastro',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        /* home: UserList(), ou */
        routes: {
          AppRoutes.home: (_) => const UserList(),
          AppRoutes.userForm: (_) => const UserForm(),
        },
      ),
    );
  }
}

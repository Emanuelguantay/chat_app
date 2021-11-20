import 'package:chat_app/services/auth_service.dart';
import 'package:chat_app/src/pages/login_page.dart';
import 'package:chat_app/src/pages/users_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  FutureBuilder(
        future: checkLoginState(context),
        builder: (context, snapshoot){
          return const Center(
            child: Text("Texto"),
          );
        },
      ),
    );
  }

  Future checkLoginState(BuildContext context) async{
    final authService = Provider.of<AuthService>(context, listen: false);
    final isLoggedIn = await authService.isLoggedIn();

    if (isLoggedIn){
      //TODO: Conectar al socket server
      //Navigator.pushReplacementNamed(context, 'users');
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (_ , __ , ___)=> const UsersPage(),
          transitionDuration: const Duration(milliseconds: 0)
        )
      );
    }else{
      //Navigator.pushReplacementNamed(context, 'login');
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (_ , __ , ___)=> const LoginPage(),
          transitionDuration: const Duration(milliseconds: 0)
        )
      );
    }
    print(isLoggedIn);
  }
}
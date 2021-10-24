import 'package:chat_app/src/pages/chat_page.dart';
import 'package:chat_app/src/pages/loading_page.dart';
import 'package:chat_app/src/pages/login_page.dart';
import 'package:chat_app/src/pages/register_page.dart';
import 'package:chat_app/src/pages/users_page.dart';
import 'package:flutter/cupertino.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  'users': ( _ ) => const UsersPage(),
  'login': ( _ ) => const LoginPage(),
  'chat': ( _ ) => const ChatPage(),
  'loading': ( _ ) => const LoadingPage(),
  'register': ( _ ) => const RegisterPage(),
};
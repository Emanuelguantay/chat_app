import 'package:chat_app/src/models/user.dart';
import 'package:flutter/material.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({Key? key}) : super(key: key);

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  late List<User> users = [
    User(uid: "1", name: "Maria", email: "maria@gmail.com", online: true),
    User(uid: "2", name: "Emanuel", email: "ema@gmail.com", online: true),
    User(uid: "3", name: "Noelia", email: "noe@gmail.com", online: false),
  ];

  final users1 = [
    User(uid: "1", name: "Maria", email: "maria@gmail.com", online: true),
    User(uid: "2", name: "Emanuel", email: "ema@gmail.com", online: true),
    User(uid: "3", name: "Noelia", email: "noe@gmail.com", online: false),
  ];

  final users2 = [
    User(uid: "1", name: "Benghy", email: "bb@gmail.com", online: true),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: const Text('Emanuel', style: TextStyle(color: Colors.black87),),
        elevation: 1,
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: (){}, icon: const Icon(Icons.exit_to_app, color: Colors.black87)),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            child: Icon (Icons.check_circle, color: Colors.blue[400],),
            //child: Icon (Icons.offline_bolt, color: Colors.red[400],),
          )
        ],
      ),
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: ListView.separated(
          itemBuilder: (_, i) => _userListTile(users[i]), 
          separatorBuilder: (_, i) => Divider(), 
          itemCount: users.length),
      )
    );
  }

  Future<void> _refresh(){
    setState(() {
      users = users1;
    });
    
    return Future.delayed(
      const Duration(seconds: 0)
    );
  }

  ListTile _userListTile(User user) {
    return ListTile(
        title: Text(user.name?? ""),
        subtitle: Text(user.email?? ""),
        leading: CircleAvatar(
          child: Text(user.name!.substring(0,2)),
          backgroundColor: Colors.blue[100],
        ),
        trailing: Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            color: user.online!? Colors.green[300]: Colors.red,
            borderRadius: BorderRadius.circular(100)
          ),
        ),
      );
  }
}
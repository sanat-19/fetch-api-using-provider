import 'package:fetch_api_provider/services/userProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    var user = Provider.of<UserProvider>(context, listen: false);
    user.getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Consumer<UserProvider>(
        builder: ((context, user, child) {
          if (user.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
              itemCount: user.users.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: Text("${user.users[index].id}"),
                    title: Text("${user.users[index].name}"),
                    subtitle: Text(
                        "${user.users[index].username}, ${user.users[index].email}"),
                  ),
                );
              });
        }),
      ),
    );
  }
}

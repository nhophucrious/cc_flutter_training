import 'package:cc_flutter_training/ui/views/users_page.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Training App'),),
      body: Center(
        child: ListView(
          children: [
            ListTile(
              iconColor: Colors.red,
              leading: const Icon(Icons.person),
              title: const Text('Users Page'),
              onTap: () {
                Get.to(() => const UsersPage());
              },
            ),
          ],
        ),
      ),
    );
  }
}
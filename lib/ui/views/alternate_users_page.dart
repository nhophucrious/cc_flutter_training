import 'package:cc_flutter_training/ui/controllers/alternate_users_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class AlternateUsersPage extends GetView<AlternateUsersController> {
  const AlternateUsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alternate users page'),
        backgroundColor: Colors.pink[200],
      ),
      body: Obx(() {
        if (controller.users.isEmpty) {
          // return const Center(child: CircularProgressIndicator());
          return Center(
              child: ElevatedButton(
            onPressed: () {
              controller.fetchUsers();
            },
            child: const Text('Fetch Users'),
          ));
        } else {
          return ListView.builder(
            itemCount: controller.users.length,
            itemBuilder: (context, index) {
              final user = controller.users[index];

              return ListTile(
                trailing: IconButton(
                  icon: const Icon(Icons.arrow_forward_ios),
                  onPressed: () {
                    print('User: ${user.name}');
                  },
                ),
                leading: CircleAvatar(
                  backgroundColor: Colors.pink[200],
                  child: const Icon(Icons.person),
                ),
                title: Text(
                  user.name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(user.address.street),
                    Text(user.address.suite),
                    Text(user.address.city),
                    Text(user.address.zipcode),
                    Text('${user.address.geo.lat}, ${user.address.geo.lng}'),
                  ],
                ),
              );
            },
          );
        }
      }),
    );
  }
}

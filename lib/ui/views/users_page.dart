import 'package:cc_flutter_training/ui/views/individual_user_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cc_flutter_training/ui/controllers/users_controller.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UsersController usersController = Get.put(UsersController());

    return Scaffold(
      appBar: AppBar(title: const Text('Users')),
      body: Obx(() {
        if (usersController.users.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
            itemCount: usersController.users.length,
            itemBuilder: (context, index) {
              final user = usersController.users[index];
              return ListTile(
                trailing: IconButton(
                  icon: const Icon(Icons.arrow_forward_ios),
                  onPressed: () {
                    Get.to(() => IndividualUserPage(), arguments: user);
                  },
                ),
                titleAlignment: ListTileTitleAlignment.center,
                leading: CircleAvatar(backgroundColor: Colors.pink[200], child: const Icon(Icons.person)),
                title: Text(user.name, style: const TextStyle(fontWeight: FontWeight.bold)),
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
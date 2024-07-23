import 'package:cc_flutter_training/ui/controllers/users_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IndividualUserPage extends StatelessWidget {
 IndividualUserPage({super.key});

 UsersController usersController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Individual User')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('You are one of ${usersController.users.length} users'),
          ],))
    );
  }
}
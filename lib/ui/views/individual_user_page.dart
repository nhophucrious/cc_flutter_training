import 'package:cc_flutter_training/ui/controllers/users_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IndividualUserPage extends StatelessWidget {
 IndividualUserPage({super.key});

 final UsersController usersController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(Get.arguments.name), backgroundColor: Colors.pink[200],),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Hello ${Get.arguments.name}', style: const TextStyle(fontWeight: FontWeight.bold),),
            Text('You are one of ${usersController.users.length} users'),
          ],))
    );
  }
}
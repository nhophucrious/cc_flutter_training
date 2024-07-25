import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IndividualUserPage extends StatelessWidget {
 IndividualUserPage({super.key});

 //final UsersController usersController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(Get.arguments.name), backgroundColor: Colors.pink[200],),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: Get.width / 3,
              backgroundColor: Colors.pink[200],
              child: Icon(Icons.person, size: Get.width / 4),
            ),
            Text('Hello ${Get.arguments.name}', style: const TextStyle(fontWeight: FontWeight.bold),),
            Text('Email: ${Get.arguments.email}'),
            // Text('Phone: ${Get.arguments.phone}'),
            Text('Website: ${Get.arguments.website}'),
            // Text('Company: ${Get.arguments.company.name}'),
          ],))
    );
  }
}
import 'package:cc_flutter_training/ui/views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const  GetMaterialApp(
      title: 'Flutter Training',
      home:  HomePage()
    );
  }
}
import 'package:cc_flutter_training/service/api_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Users Page'),),
      body: Center(
        child: _body(),
      )
    );
  }

  FutureBuilder _body() {
    final apiService = ApiService(Dio(BaseOptions(contentType: 'application/json')));
    return FutureBuilder(
      future: apiService.getUsers(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return ListTile(

                  trailing: const Icon(Icons.arrow_forward_ios),
                  titleAlignment: ListTileTitleAlignment.center,
                  leading: CircleAvatar(backgroundColor: Colors.pink[200],
                  child: const Icon(Icons.person),),
                  title: Text(snapshot.data[index].name,
                  style: const TextStyle(fontWeight: FontWeight.bold),),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Text(snapshot.data[index].address.street),
                    Text(snapshot.data[index].address.suite),
                    Text(snapshot.data[index].address.city),
                    Text(snapshot.data[index].address.zipcode),
                    Text(snapshot.data[index].address.geo.lat + ', ' + snapshot.data[index].address.geo.lng),
                  ],),
                );
              },
            );
          }
        }
      },
    );
  }
}
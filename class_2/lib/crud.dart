import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class Crud_Screen extends StatefulWidget {
  const Crud_Screen({super.key});

  @override
  State<Crud_Screen> createState() => _Crud_ScreenState();
}

// ignore: camel_case_types
class _Crud_ScreenState extends State<Crud_Screen> {
  @override
  Widget build(BuildContext context) {
    final CollectionReference todo =
        FirebaseFirestore.instance.collection('todo');
    return Scaffold(
      appBar: AppBar(
        title: const Text('CRUD'),
      ),
      body: StreamBuilder(
        stream: todo.snapshots(),
        // initialData: ,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          return !snapshot.hasData
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(snapshot.data!.docs[index]['name']),
                    subtitle: Text(snapshot.data!.docs[index]['country']),
                  );
                });
        },
      ),
    );
  }
}

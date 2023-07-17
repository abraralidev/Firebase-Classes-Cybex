import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Dasboard extends StatefulWidget {
  const Dasboard({super.key});

  @override
  State<Dasboard> createState() => _DasboardState();
}

class _DasboardState extends State<Dasboard> {
  @override
  Widget build(BuildContext context) {
    final CollectionReference todo =
        FirebaseFirestore.instance.collection('users');
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Todo'),
      ),
      body: StreamBuilder(
          stream: todo.snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            return !snapshot.hasData
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(snapshot.data!.docs[index]['name']),
                        subtitle: Text(snapshot.data!.docs[index]['email']),
                      );
                    });
          }),
    );
  }
}

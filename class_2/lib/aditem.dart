import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddItems extends StatefulWidget {
  const AddItems({super.key});

  @override
  State<AddItems> createState() => _AddItemsState();
}

class _AddItemsState extends State<AddItems> {
  final TextEditingController name_controller = TextEditingController();
   final TextEditingController country_controller = TextEditingController();
  final CollectionReference todo =
      FirebaseFirestore.instance.collection('todo');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Data"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextFormField(
              controller: name_controller,
              decoration: const InputDecoration(hintText: 'Name'),
            ),
          ),
           Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextFormField(
              controller: country_controller,
              decoration: const InputDecoration(hintText: 'Country'),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                todo.doc().set(
                  {
                    'country':  country_controller.text,
                    'name': name_controller.text
                  }
                );
              },
              child: const Text("Upload"))
        ],
      ),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UpdateItems extends StatefulWidget {
  const UpdateItems({super.key, required this.idwidget});
final String idwidget;
  @override
  State<UpdateItems> createState() => _UpdateItemsState();
}

class _UpdateItemsState extends State<UpdateItems> {
  final TextEditingController itemcontroller = TextEditingController();
  final TextEditingController countrycontroller = TextEditingController();
  final CollectionReference todo =
      FirebaseFirestore.instance.collection('todo');
      
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Update Data"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextFormField(
              controller: itemcontroller,
              decoration: const InputDecoration(hintText: 'Name'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextFormField(
              controller: countrycontroller,
              decoration: const InputDecoration(hintText: 'Country'),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                todo.doc(widget.idwidget).update({
                  'country': countrycontroller.text,
                  'name': itemcontroller.text
                });
              },
              child: const Text("Update"))
        ],
      ),
    );
  }
}

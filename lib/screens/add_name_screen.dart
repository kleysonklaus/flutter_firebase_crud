import 'package:flutter/material.dart';
import 'package:flutter_firebase_crud/services/firebase_service.dart';

class AddNameScreen extends StatefulWidget {
  const AddNameScreen({super.key});

  @override
  State<AddNameScreen> createState() => _AddNameScreenState();
}

class _AddNameScreenState extends State<AddNameScreen> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("añadir")),
      body: Column(
        children: [
          TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: 'Ingrese nuevo nombre',
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (controller.text.isEmpty) return;
              insertName(name: controller.text);
              Navigator.of(context).pop();
            },
            child: const Text("Guardar"),
          ),
        ],
      ),
    );
  }
}

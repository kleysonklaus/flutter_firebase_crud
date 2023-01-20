import 'package:flutter/material.dart';
import 'package:flutter_firebase_crud/services/firebase_service.dart';

class AddNameScreen extends StatefulWidget {
  const AddNameScreen({super.key});

  @override
  State<AddNameScreen> createState() => _AddNameScreenState();
}

class _AddNameScreenState extends State<AddNameScreen> {
  final controller = TextEditingController();

  Future<void> sendCreated(String text) async {
    if (text.isEmpty) return;
    await insertName(name: controller.text).then(
      (value) => Navigator.of(context).pop(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("añadir")),
      body: Column(
        children: [
          TextField(
            onSubmitted: sendCreated,
            controller: controller,
            decoration: const InputDecoration(
              hintText: 'Ingrese nuevo nombre',
            ),
          ),
          ElevatedButton(
            onPressed: () => sendCreated(controller.text),
            child: const Text("Guardar"),
          ),
        ],
      ),
    );
  }
}

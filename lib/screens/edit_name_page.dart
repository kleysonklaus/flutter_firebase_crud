import 'package:flutter/material.dart';
import 'package:flutter_firebase_crud/services/firebase_service.dart';

class EditNamePage extends StatefulWidget {
  const EditNamePage({super.key});

  @override
  State<EditNamePage> createState() => _EditNamePageState();
}

class _EditNamePageState extends State<EditNamePage> {
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
            onPressed: () async {
              if (controller.text.isEmpty) return;
              await insertName(name: controller.text).then(
                (value) => Navigator.of(context).pop(),
              );
            },
            child: const Text("Guardar"),
          ),
        ],
      ),
    );
  }
}

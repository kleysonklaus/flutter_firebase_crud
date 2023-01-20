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
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Map args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    controller.text = args['name'];
    return Scaffold(
      appBar: AppBar(title: const Text("Editar nombre")),
      body: Column(
        children: [
          TextField(
            controller: controller,
            decoration: const InputDecoration(
              hintText: 'Editar nombre',
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              if (controller.text.isEmpty) return;
              await updateName(
                uid: args['uid'],
                newName: controller.text,
              ).then(
                (value) => Navigator.of(context).pop(),
              );
            },
            child: const Text("Actualizar"),
          ),
        ],
      ),
    );
  }
}

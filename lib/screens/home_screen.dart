import 'package:flutter/material.dart';

// servicios
import 'package:flutter_firebase_crud/services/firebase_service.dart';

class Home extends StatefulWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material App Bar'),
      ),
      body: FutureBuilder(
        future: getPeople(),
        builder: ((context, AsyncSnapshot<List<dynamic>> snapshot) {
          if (snapshot.hasData == false) {
            return const Center(child: CircularProgressIndicator());
          }

          final data = snapshot.data!;

          return ListView(
            children: data.map((item) {
              return Dismissible(
                background: Container(
                  color: Colors.red,
                  child: const Icon(Icons.delete),
                ),
                key: Key(item['uid']),
                direction: DismissDirection.endToStart,
                onDismissed: (direction) async {
                  // if (direction == DismissDirection.endToStart) {
                  await deleteName(uid: item['uid']);
                  data.remove(item);
                  // setState(() {});
                  // }
                },
                confirmDismiss: (direction) async {
                  if (direction == DismissDirection.endToStart) {
                    bool? result = false;
                    result = await showDialog(
                        context: context,
                        builder: (_) {
                          return AlertDialog(
                            title: Text(
                                "Estas seguro de querer eliminar ${item['name']}?"),
                            actions: [
                              TextButton(
                                  onPressed: () =>
                                      Navigator.of(context).pop(true),
                                  child: const Text("SI")),
                              TextButton(
                                  onPressed: () =>
                                      Navigator.of(context).pop(false),
                                  child: const Text("NO")),
                            ],
                          );
                        });

                    return result;
                  }
                },
                child: ListTile(
                  title: Text("${item['name']}"),
                  onTap: () async {
                    await Navigator.pushNamed(
                      context,
                      '/edit',
                      arguments: {
                        "name": item['name'],
                        "uid": item['uid'],
                      },
                    );
                    setState(() {});
                  },
                ),
              );
            }).toList(),
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.pushNamed(context, '/add');
          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

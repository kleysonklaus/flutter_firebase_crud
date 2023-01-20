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
              return ListTile(
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

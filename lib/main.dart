import 'package:flutter/material.dart';
// Importaciones de Firebase
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_firebase_crud/screens/add_name_screen.dart';
import 'package:flutter_firebase_crud/screens/edit_name_page.dart';
import 'package:flutter_firebase_crud/screens/home_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      theme: ThemeData(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': ((context) => const Home()),
        '/add': (context) => const AddNameScreen(),
        '/edit': (context) => const EditNamePage(),
      },
    );
  }
}

import 'package:blood_donor_app/firebase_options.dart';
import 'package:blood_donor_app/view/home_screen/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

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
      debugShowCheckedModeBanner: false,
      title: 'Firebase_CRUD',
      theme: ThemeData(
        appBarTheme:
            const AppBarTheme(backgroundColor: Colors.red, centerTitle: true),
        useMaterial3: false,
      ),
      home: HomeScreen(),
    );
  }
}

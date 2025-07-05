import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'auth_screen.dart';
import 'home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyBQsvtTqjZdBvtZFJs5I9vfEKJAsRnPiWc",
        authDomain: "note-app-770c1.firebaseapp.com",
        projectId: "note-app-770c1",
        storageBucket: "note-app-770c1.firebasestorage.app",
        messagingSenderId: "613818944989",
        appId: "1:613818944989:web:3625ea16bb0a2a3fc73a34",
        measurementId: "G-BNCH8905DC",
      ),
    );
  } else {
    await Firebase.initializeApp();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Note App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      ),
      home: const AuthScreen(),
      routes: {
        '/home': (context) => const HomeScreen(),
      },
    );
  }
}

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:yourinsta/screens/signup.dart';
import 'package:yourinsta/utils.dart/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // to make sure that the widgets are initialized before running the app
  await Firebase.initializeApp();
  await Supabase.initialize(
    url: 'https://etwrzpharglmoscejhsr.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImV0d3J6cGhhcmdsbW9zY2VqaHNyIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDQyMjE1OTcsImV4cCI6MjA1OTc5NzU5N30.578VwQPmvarTQ_3pWW1FxSDxfeTffyLPRmVIACiyWEg',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "YourInsta",
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: mobileBackgroundColor,
      ),
      // home: const ResponsiveLayout(
      //   webScreen: WebScreen(),
      //   mobileScreen: MobileScreen(),
      // ),
      home: SignupScreen(),
    );
  }
}

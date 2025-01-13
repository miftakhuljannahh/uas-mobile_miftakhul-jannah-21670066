import 'package:flutter/material.dart';
import 'package:uas_miftakhul/login.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uas_miftakhul/notes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://eutjvvowalrrlkonigbz.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImV1dGp2dm93YWxycmxrb25pZ2J6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzY1Nzg0OTgsImV4cCI6MjA1MjE1NDQ5OH0.QnA1i4CDkfc1BMBvdIcNuWWo04z5GpauZi0HRPqxPEA',
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:main_app/models/user.dart';
import 'package:main_app/widgets/card.dart';

void main() {
  runApp(const MyApp());
}

User jeniel = User(
  name: 'Jeniel Urena',
  role: 'Software Engineer',
  imageUrl:
      'https://pbs.twimg.com/profile_images/1610841683645661186/CfxJxN92_x96.jpg',
  skills: ['Dart', 'Flutter', 'Firebase', 'Node.js', 'MongoDB'],
  socialMedia: ['facebook', 'linkedin', 'instagram', 'github'],
  projects: 10,
  followers: 1000,
  rating: 4.5,
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Card Demo'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: ProfileCard(user: jeniel),
      ),
    );
  }
}

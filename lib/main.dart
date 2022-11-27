import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotify_project_2/providers/app_provider.dart';
import 'pages/root_page.dart';
import 'providers/spotify_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SpotifyProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => AppProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const RootPage(),
    );
  }
}

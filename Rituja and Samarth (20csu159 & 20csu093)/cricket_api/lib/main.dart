import 'package:first_app/info_screen.dart';
import 'package:flutter/material.dart';

import 'movie_Review.dart';

void main() {
  runApp(MyApp());
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return const MaterialApp(
    //   home: Center(child: SafeArea(child: Text("Hello Flutter!!")))
    // );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      // home: InfoScreen(),
      routes: {
        '/': (context) => InfoScreen(),
        '/movieReview': (context) => MovieReview()
      },
      initialRoute: '/',
    );
  }
}

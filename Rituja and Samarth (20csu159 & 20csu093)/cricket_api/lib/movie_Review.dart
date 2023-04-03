import 'package:flutter/material.dart';
import 'bottom_navigation.dart';
import 'menu_draw.dart';

class MovieReview extends StatelessWidget {
  const MovieReview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Moview Reviews'),
      ),
      drawer: const MenuDrawer(),
      bottomNavigationBar: BottomNavigation(),
      //body: const Center(child: FlutterLogo()),
      body: const Center(child: SayMyName()),
    );
  }
}

class SayMyName extends StatefulWidget {
  const SayMyName({super.key});

  @override
  State<SayMyName> createState() => _SayMyNameState();
}

class _SayMyNameState extends State<SayMyName> {
  String name = '';
  TextEditingController textField = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: textField,
        ),
        ElevatedButton(onPressed: (){
          setState(() {
            name = textField.text;
          });
        }, 
        child: Text('Say My Name')),
        Text('Hello'+name),
      ],
    );
  }
}

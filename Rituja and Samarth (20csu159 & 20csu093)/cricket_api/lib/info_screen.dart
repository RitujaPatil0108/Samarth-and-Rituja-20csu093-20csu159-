import 'package:flutter/material.dart';
import 'bottom_navigation.dart';
import 'menu_draw.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuDrawer(),
      bottomNavigationBar: BottomNavigation(),
      appBar: AppBar(
        title: const Text("Flutter Home"),
        backgroundColor: Colors.blueGrey[400],
        actions: [
          Icon(Icons.phone),
          SizedBox(
            // to give space between icons
            width: 30,
          ),
          Icon(Icons.message_outlined),
          SizedBox(
            width: 30,
          )
        ],
      ),

      // body: Image.network(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            // fit: BoxFit.cover,
            image: NetworkImage(
                "https://images.unsplash.com/photo-1676909433899-dd4a3fd29a84?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80"),
          ),
        ),
        child: Center(
            child: Container(
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.white38),
                child: Text(
                  'Batman',
                  style: TextStyle(fontSize: 20),
                ))),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Text(
          '+',
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
      ),
    );
  }
}

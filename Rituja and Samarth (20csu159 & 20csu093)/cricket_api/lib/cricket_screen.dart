import 'package:first_app/model/http_helper.dart';
import 'package:first_app/model/Player.dart';
import 'package:flutter/material.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  TextEditingController textController = TextEditingController();
  Player result = Player('', '', '', '', '', '', '', 0, 0, 0.0, '');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Cricket Screen'),
        ),
        body: Padding(
            padding: const EdgeInsets.all(15),
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: TextField(
                    controller: textController,
                    decoration: InputDecoration(
                        hintText: 'Enter match Name',
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.search),
                          onPressed: getData,
                        )),
                  ),
                ),
                cricketRow('Name: ', result.name),
                cricketRow('Match Type: ', result.matchType),
                cricketRow('Date: ', result.date),
                cricketRow('Venue: ', result.venue),
                cricketRow('Team 1: ', result.team1),
                cricketRow('Team 2: ', result.team2),
                cricketRow('Status: ', result.status),
                cricketRow('Runs: ', result.r.toStringAsFixed(2)),
                cricketRow('Wickets: ', result.w.toStringAsFixed(2)),
                cricketRow('Overs: ', result.o.toStringAsFixed(2)),
                cricketRow('Innings: ', result.inning),
              ],
            )));
  }

  Future getData() async {
    HttpHelper httpHelper = HttpHelper();
    result = await httpHelper.getPlayerInfo(textController.text);
    setState(() {
      result;
    });
    print(result);
  }

  Widget cricketRow(String label, String value) {
    Widget row = Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        children: [
          Expanded(
              flex: 3,
              child: Text(
                label,
                style:
                    TextStyle(fontSize: 20, color: Theme.of(context).hintColor),
              )),
          Expanded(
              flex: 4,
              child: Text(
                value,
                style: TextStyle(
                    fontSize: 20, color: Theme.of(context).primaryColor),
              )),
        ],
      ),
    );
    return row;
  }
}

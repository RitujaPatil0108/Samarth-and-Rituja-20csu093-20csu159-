class Player {
  String name = '';
  String matchType = '';
  String date = '';
  String team1 = '';
  String team2 = '';
  String venue = '';
  String status = '';
  int r = 0;
  int w= 0;
  double o = 0.0;
  String inning = '';

  Player(this.name, this.matchType, this.date, this.venue, this.team1, this.team2, this.status, this.r, this.w, this.o, this.inning);

  Player.fromJson(Map<String, dynamic> cricketData) {
    name = cricketData['data'][2]['name'];
    matchType = cricketData['data'][2]['matchType'] ?? '';
    date = cricketData['data'][2]['date'] ?? '';
    venue = cricketData['data'][2]['venue'] ?? '';
    team1 = cricketData['data'][2]['teams'][0] ?? '';
    team2 = cricketData['data'][2]['teams'][1]?? '';
    status = cricketData['data'][2]['status'] ?? '';
    r = cricketData['data'][2]['score'][0]['r'] ?? 0;
    w = cricketData['data'][2]['score'][0]['w'] ?? 0;
    //o = cricketData['data'][2]['score'][0]['o'] ?? 0.0;
    inning = cricketData['data'][2]['score'][0]['inning'] ?? '';

  }
}

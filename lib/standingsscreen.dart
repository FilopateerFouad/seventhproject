import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Standingsscreen extends StatefulWidget {
  const Standingsscreen({super.key});

  @override
  State<Standingsscreen> createState() => _StandingsscreenState();
}

class _StandingsscreenState extends State<Standingsscreen> {
  @override
  void initState() {
    super.initState();
    fetchStandings('2020-11-03');
  }

  List standings = [];
  bool isLoading = true;
  Future<void> fetchStandings(String date) async {
    var client = http.Client();
    var param = {'season': '2022', 'league': '39'};
    var response = await client.get(
        Uri.parse('https://v3.football.api-sports.io/standings?${Uri(queryParameters: param).query}'),
        headers: {
          'x-rapidapi-key': 'e2e707c4dc0de06a72f22b1e23480666',
          'x-rapidapi-host': 'v3.football.api-sports.io'
        });
   // print(json.decode(response.body));
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
     // print('Response Data: $data'); // Debugging line
      if (data['response'] != null && data['response'].isNotEmpty) {
        setState(() {
          standings = data['response'][0]['league']['standings'][0];
          isLoading = false;
        });
      } else {
        print('No fixtures found for the date $date');
      }
    } else {
      print('Failed to fetch fixtures: ${response.reasonPhrase}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Football Standings'),
         backgroundColor: const Color(0xFF438FCE) 
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: standings.length,
              itemBuilder: (context, index) {
                var team = standings[index];
                return ListTile(
                  leading: Row(mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("${team['rank'].toString()}  "),
                   team['team']['logo'] != null
                          ? Image.network(
                              team['team']['logo'],
                              width: 40,
                              height: 40,
                            )
                          : const CircleAvatar(
                              backgroundColor: Colors.blue,
                              child: Text("No Logo"),
                            ),
                    ],
                  ),
                  title: Text(team['team']['name']),
                  subtitle: Text('${team['points']} points'),
                );
              },
            ),
    );
  }
}

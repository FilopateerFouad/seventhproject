import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FixturesPage extends StatefulWidget {
  const FixturesPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FixturesPageState createState() => _FixturesPageState();
}

class _FixturesPageState extends State<FixturesPage> {
  List fixtures = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchFixtures('2020-11-03');
  }

  Future<void> fetchFixtures(String date) async {
    var client = http.Client();
    var param = {'season': '2022', 'league': '39'};
    var response = await client.get(
        Uri.parse(
            'https://v3.football.api-sports.io/fixtures?${Uri(queryParameters: param).query}'),
        headers: {
          'x-rapidapi-key': 'e2e707c4dc0de06a72f22b1e23480666',
          'x-rapidapi-host': 'v3.football.api-sports.io'
        });
    //print(json.decode(response.body));
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      //print('Response Data: $data'); // Debugging line
      if (data['response'] != null && data['response'].isNotEmpty) {
        setState(() {
          fixtures = data['response'];
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
        title: const Text('Football Fixtures'),
         backgroundColor: const Color(0xFF438FCE)
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount:
                  fixtures.length, 
              itemBuilder: (context, index) {
                var match = fixtures[index];
                return ListTile(
                  leading: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.network(
                        match['teams']['home']['logo'],
                        width: 40,
                        height: 40,
                      ),
                      const SizedBox(width: 10),
                      Image.network(
                        match['teams']['away']['logo'],
                        width: 40,
                        height: 40,
                      ),
                    ],
                  ),
                  title: Text(
                      '${match['teams']['home']['name']} vs ${match['teams']['away']['name']}'),
                  subtitle: Text(
                      '${match['league']['name']} - ${match['fixture']['date']}'),
                );
              },
            ),
    );
  }
}

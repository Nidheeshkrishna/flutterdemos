import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'API Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ApiService apiService =
      ApiService('http://192.168.1.44:5000/api/v1/bookings');
  List<Map<String, dynamic>> bookings = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final data = await apiService.fetchBookings();
      setState(() {
        bookings = data;
      });
    } catch (error) {
      print('Error fetching data: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('API Demo'),
      ),
      body: Column(
        children: [
          const Text('Bookings from API:'),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: bookings.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(bookings[index]['Name']),
                  subtitle: Text('Date: ${bookings[index]['date']}'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ApiService {
  final String apiUrl;

  ApiService(this.apiUrl);

  Future<List<Map<String, dynamic>>> fetchBookings() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body)['data'];
        return List<Map<String, dynamic>>.from(data);
      } else {
        throw Exception(
            'Failed to fetch data. Status code: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Error fetching data: $error');
    }
  }
}

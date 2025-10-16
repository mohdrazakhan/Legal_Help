import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// Data Model: A blueprint for a single IPC section.
// This helps our app understand the data we get from the API.
// Data Model: A blueprint for a single IPC section.
class IpcSection {
  final String section;
  final String sectionTitle;
  final String sectionDesc;

  const IpcSection({
    required this.section,
    required this.sectionTitle,
    required this.sectionDesc,
  });

  // A 'factory constructor' that creates an IpcSection from a JSON object.
  factory IpcSection.fromJson(Map<String, dynamic> json) {
    return IpcSection(
      // THE FINAL FIX IS HERE: Use the correct key 'Section'
      section: (json['Section'] ?? 'N/A').toString(),
      sectionTitle: json['section_title'] ?? 'No Title',
      sectionDesc: json['section_desc'] ?? 'No Description',
    );
  }
}

// API Service: This function is responsible for fetching the data.
Future<List<IpcSection>> fetchIpcSections() async {
  // IMPORTANT: Make sure your Python server is running!
  // For iOS Simulator or a web build, 'localhost' or '127.0.0.1' works.
  // For an Android Emulator, use '10.0.2.2' instead of 'localhost'.
  // If using a physical device, replace with your computer's network IP address.
  const url = 'http://10.180.29.246:5000/ipc/all';
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    // If the server returns a 200 OK response, then parse the JSON.
    List<dynamic> jsonResponse = json.decode(response.body);
    return jsonResponse.map((section) => IpcSection.fromJson(section)).toList();
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load IPC sections');
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Legal Help',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: const HomeScreen(),
    );
  }
}

// We convert HomeScreen to a StatefulWidget to manage the state of our API call.
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // A variable to hold the result of our API call.
  late Future<List<IpcSection>> futureIpcSections;

  @override
  void initState() {
    super.initState();
    // Start the API call as soon as the widget is created.
    futureIpcSections = fetchIpcSections();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Legal Help - IPC Sections')),
      body: Center(
        // FutureBuilder is the perfect widget for handling API calls.
        // It shows different things based on the state of the 'Future'.
        child: FutureBuilder<List<IpcSection>>(
          future: futureIpcSections,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // While data is loading, show a progress spinner.
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              // If an error occurred, show an error message.
              return Text('Error: ${snapshot.error}');
            } else if (snapshot.hasData) {
              // If we have data, display it in a scrollable list.
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final section = snapshot.data![index];
                  return ListTile(
                    leading: CircleAvatar(child: Text(section.section)),
                    title: Text(section.sectionTitle),
                    subtitle: Text(
                      section.sectionDesc,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  );
                },
              );
            } else {
              // Default case
              return const Text('No data found.');
            }
          },
        ),
      ),
    );
  }
}

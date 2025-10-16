// lib/screens/home_screen.dart

import 'package:flutter/material.dart';
import '../models/ipc_section.dart';
import '../services/api_service.dart';
import 'detail_screen.dart';

class HomeScreen extends StatefulWidget {
  // It now requires an actName to be passed to it
  final String actName;
  const HomeScreen({super.key, required this.actName});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isLoading = true;
  List<IpcSection> _allSections = [];
  List<IpcSection> _filteredSections = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fetchSections();
  }

  // This function now uses the actName from the widget
  Future<void> _fetchSections() async {
    try {
      // We pass widget.actName to our upgraded service
      final sections = await ApiService.fetchSectionsForAct(widget.actName);
      setState(() {
        _allSections = sections;
        _filteredSections = sections;
        _isLoading = false;
      });
    } catch (e) {
      // ... error handling
    }
  }

  void _filterSections(String query) {
    // ... filtering logic remains the same
    List<IpcSection> filteredList = [];
    if (query.isEmpty) {
      filteredList = _allSections;
    } else {
      filteredList = _allSections.where((section) {
        final titleLower = section.sectionTitle.toLowerCase();
        final descLower = section.sectionDesc.toLowerCase();
        final queryLower = query.toLowerCase();
        return titleLower.contains(queryLower) ||
            descLower.contains(queryLower);
      }).toList();
    }
    setState(() {
      _filteredSections = filteredList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // The title is now dynamic
        title: Text('${widget.actName} Sections'),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'Search in ${widget.actName}...',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    onChanged: _filterSections,
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: _filteredSections.length,
                    itemBuilder: (context, index) {
                      final section = _filteredSections[index];
                      return ListTile(
                        leading: CircleAvatar(child: Text(section.section)),
                        title: Text(section.sectionTitle),
                        subtitle: Text(
                          section.sectionDesc,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  DetailScreen(section: section),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}

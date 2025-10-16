// lib/screens/detail_screen.dart

import 'package:flutter/material.dart';
import '../models/ipc_section.dart';

class DetailScreen extends StatelessWidget {
  final IpcSection section;

  const DetailScreen({super.key, required this.section});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Section ${section.section}')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                section.sectionTitle,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 16),
              Text(
                section.sectionDesc,
                style: const TextStyle(fontSize: 16.0, height: 1.5),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

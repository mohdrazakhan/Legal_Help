// lib/screens/act_selection_screen.dart

import 'package:flutter/material.dart';
import 'home_screen.dart';

// A simple class to hold the details for each legal act card
class LegalAct {
  final String title;
  final String
  shortName; // This must match the table name in the DB (e.g., 'IPC')
  final String description;
  final IconData icon;

  LegalAct({
    required this.title,
    required this.shortName,
    required this.description,
    required this.icon,
  });
}

class ActSelectionScreen extends StatelessWidget {
  ActSelectionScreen({super.key});

  // A list of all the acts our app supports
  final List<LegalAct> supportedActs = [
    LegalAct(
      title: 'Indian Penal Code, 1860',
      shortName: 'IPC',
      description: 'The official criminal code of India.',
      icon: Icons.gavel_rounded,
    ),
    LegalAct(
      title: 'Code of Criminal Procedure, 1973',
      shortName: 'CRPC',
      description: 'Procedure for administration of substantive criminal law.',
      icon: Icons.local_police_rounded,
    ),
    LegalAct(
      title: 'Civil Procedure Code, 1908',
      shortName: 'CPC',
      description: 'Procedure related to the administration of civil law.',
      icon: Icons.account_balance_rounded,
    ),
    LegalAct(
      title: 'Indian Evidence Act, 1872',
      shortName: 'IEA',
      description: 'Rules governing admissibility of evidence in court.',
      icon: Icons.fact_check_rounded,
    ),
    LegalAct(
      title: 'Hindu Marriage Act, 1955',
      shortName: 'HMA',
      description: 'Governs the laws of marriage for Hindus.',
      icon: Icons.favorite_rounded,
    ),
    LegalAct(
      title: 'Indian Divorce Act, 1869',
      shortName: 'IDA',
      description: 'Governs the laws of divorce for Christians in India.',
      icon: Icons.heart_broken_rounded,
    ),
    LegalAct(
      title: 'Negotiable Instruments Act, 1881',
      shortName: 'NIA',
      description: 'Governs cheques, promissory notes, bills of exchange, etc.',
      icon: Icons.request_quote_rounded,
    ),
    LegalAct(
      title: 'The Motor Vehicles Act, 1988',
      shortName: 'MVA',
      description: 'Governs all aspects of road transport vehicles.',
      icon: Icons.directions_car_rounded,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Select a Legal Act')),
      body: ListView.builder(
        itemCount: supportedActs.length,
        itemBuilder: (context, index) {
          final act = supportedActs[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: ListTile(
              leading: Icon(act.icon, color: Theme.of(context).primaryColor),
              title: Text(act.title),
              subtitle: Text(act.description),
              trailing: const Icon(Icons.arrow_forward_ios_rounded),
              onTap: () {
                // When tapped, navigate to the list screen, passing the act name
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(actName: act.shortName),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

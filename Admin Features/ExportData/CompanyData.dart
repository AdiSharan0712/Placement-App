import 'package:flutter/material.dart';

class ManageCompaniesScreen extends StatefulWidget {
  @override
  _ManageCompaniesScreenState createState() => _ManageCompaniesScreenState();
}

class _ManageCompaniesScreenState extends State<ManageCompaniesScreen> {
  void _exportCompanies() async {
    List<List<dynamic>> rows = [];

    rows.add(["ID", "Name"]);
    for (var company in companies) {
      rows.add([company.id, company.name]);
    }

    await exportDataToCSV(rows, "companies_data");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Companies'),
        actions: [
          IconButton(
            icon: Icon(Icons.download),
            onPressed: _exportCompanies,
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: companies.length,
        itemBuilder: (context, index) {
          final company = companies[index];
          return ListTile(
            title: Text(company.name),
            subtitle: Text('ID: ${company.id}'),
          );
        },
      ),
    );
  }
}

class Company {
  final String id;
  final String name;

  Company({required this.id, required this.name});
}

List<Company> companies = [
  Company(id: '1', name: 'Company A'),
  Company(id: '2', name: 'Company B'),
  Company(id: '3', name: 'Company C'),
];

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

  void _addCompany(String id, String name) {
    setState(() {
      companies.add(Company(id: id, name: name));
    });
  }

  void _editCompany(int index, String id, String name) {
    setState(() {
      companies[index] = Company(id: id, name: name);
    });
  }

  void _deleteCompany(int index) {
    setState(() {
      companies.removeAt(index);
    });
  }

  void _showCompanyForm({Company? company, int? index}) {
    final TextEditingController idController =
        TextEditingController(text: company?.id ?? '');
    final TextEditingController nameController =
        TextEditingController(text: company?.name ?? '');

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(company == null ? 'Add Company' : 'Edit Company'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: idController,
                decoration: InputDecoration(labelText: 'ID'),
              ),
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Name'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (company == null) {
                  _addCompany(idController.text, nameController.text);
                } else if (index != null) {
                  _editCompany(index, idController.text, nameController.text);
                }
                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
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
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    _showCompanyForm(company: company, index: index);
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    _deleteCompany(index);
                  },
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _showCompanyForm();
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
  Company(id: '3', name: 'Company C'),
];

// Placeholder for exportDataToCSV function
Future<void> exportDataToCSV(List<List<dynamic>> rows, String fileName) async {
  // Implement your CSV export logic here
}

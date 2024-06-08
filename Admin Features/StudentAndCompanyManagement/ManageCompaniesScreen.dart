class ManageCompaniesScreen extends StatefulWidget {
  @override
  _ManageCompaniesScreenState createState() => _ManageCompaniesScreenState();
}

class _ManageCompaniesScreenState extends State<ManageCompaniesScreen> {
  void _addCompany() {
    // Implement add company functionality
  }

  void _editCompany(Company company) {
    // Implement edit company functionality
  }

  void _deleteCompany(Company company) {
    setState(() {
      companies.remove(company);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Companies'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: _addCompany,
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: companies.length,
        itemBuilder: (context, index) {
          final company = companies[index];
          return ListTile(
            title: Text(company.name),
            subtitle: Text('CTC: ${company.ctc}\nJob Role: ${company.jobRole}'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () => _editCompany(company),
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => _deleteCompany(company),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

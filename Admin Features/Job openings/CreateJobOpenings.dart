import 'package:flutter/material.dart';

class ManageJobOpeningsScreen extends StatefulWidget {
  @override
  _ManageJobOpeningsScreenState createState() => _ManageJobOpeningsScreenState();
}

class _ManageJobOpeningsScreenState extends State<ManageJobOpeningsScreen> {
  void _addJobOpening() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CreateEditJobOpeningScreen(),
      ),
    );
  }

  void _editJobOpening(JobOpening jobOpening) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CreateEditJobOpeningScreen(jobOpening: jobOpening),
      ),
    );
  }

  void _deleteJobOpening(JobOpening jobOpening) {
    setState(() {
      jobOpenings.remove(jobOpening);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Job Openings'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: _addJobOpening,
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: jobOpenings.length,
        itemBuilder: (context, index) {
          final jobOpening = jobOpenings[index];
          return ListTile(
            title: Text(jobOpening.title),
            subtitle: Text('CTC: ${jobOpening.ctc}\n${jobOpening.description}'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () => _editJobOpening(jobOpening),
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => _deleteJobOpening(jobOpening),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}


import 'package:flutter/material.dart';

class CreateEditJobOpeningScreen extends StatefulWidget {
  final JobOpening? jobOpening;

  CreateEditJobOpeningScreen({this.jobOpening});

  @override
  _CreateEditJobOpeningScreenState createState() => _CreateEditJobOpeningScreenState();
}

class _CreateEditJobOpeningScreenState extends State<CreateEditJobOpeningScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _ctcController = TextEditingController();
  final _descriptionController = TextEditingController();
  String? _selectedCompanyId;

  @override
  void initState() {
    super.initState();
    if (widget.jobOpening != null) {
      _titleController.text = widget.jobOpening!.title;
      _ctcController.text = widget.jobOpening!.ctc;
      _descriptionController.text = widget.jobOpening!.description;
      _selectedCompanyId = widget.jobOpening!.companyId;
    }
  }

  void _saveJobOpening() {
    if (_formKey.currentState!.validate()) {
      final newJobOpening = JobOpening(
        id: widget.jobOpening?.id ?? DateTime.now().toString(),
        companyId: _selectedCompanyId!,
        title: _titleController.text,
        ctc: _ctcController.text,
        description: _descriptionController.text,
      );

      if (widget.jobOpening != null) {
        setState(() {
          jobOpenings[jobOpenings.indexOf(widget.jobOpening!)] = newJobOpening;
        });
      } else {
        setState(() {
          jobOpenings.add(newJobOpening);
        });
      }

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.jobOpening == null ? 'Create Job Opening' : 'Edit Job Opening'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(labelText: 'Job Title'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a job title';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _ctcController,
                decoration: InputDecoration(labelText: 'CTC'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the CTC';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: 'Job Description'),
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a job description';
                  }
                  return null;
                },
              ),
              DropdownButtonFormField<String>(
                value: _selectedCompanyId,
                hint: Text('Select Company'),
                items: companies.map((company) {
                  return DropdownMenuItem<String>(
                    value: company.id,
                    child: Text(company.name),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedCompanyId = value;
                  });
                },
                validator: (value) {
                  if (value == null) {
                    return 'Please select a company';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveJobOpening,
                child: Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

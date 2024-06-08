import 'package:flutter/material.dart';

void main() {
  runApp(PlacementPortal());
}

class PlacementPortal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Placement Portal',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => PlacementMatsPage(),
        '/login': (context) => LoginPage(),
        '/home': (context) => HomePage(),
        '/prediction': (context) => PredictionPage(),
        '/manage-job-openings': (context) => ManageJobOpeningsScreen(),
        '/create-edit-job-opening': (context) => CreateEditJobOpeningScreen(),
      },
    );
  }
}

class PlacementMatsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Placement Portal - Placemats'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/login');
          },
          child: Text('Proceed to Login'),
        ),
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _usnController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool _isLoading = false;

  Future<bool> _authenticateUser(String usn, String password) async {
    await Future.delayed(Duration(seconds: 2));

    if (usn == 'example_usn' && password == 'example_password') {
      return true;
    } else {
      return false;
    }
  }

  void _login() async {
    setState(() {
      _isLoading = true;
    });

    String usn = _usnController.text;
    String password = _passwordController.text;

    bool isAuthenticated = await _authenticateUser(usn, password);

    setState(() {
      _isLoading = false;
    });

    if (isAuthenticated) {
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Invalid credentials. Please try again.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _usnController,
                decoration: InputDecoration(labelText: 'USN'),
              ),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
              SizedBox(height: 20),
              _isLoading
                  ? CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: _login,
                      child: Text('Login'),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> jobList = [
      'Company A - Software Engineer',
      'Company B - Data Analyst',
      'Company C - UI/UX Designer',
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: ListView.builder(
        itemCount: jobList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(jobList[index]),
            onTap: () {
              Navigator.pushNamed(context, '/prediction');
            },
          );
        },
      ),
    );
  }
}

class PredictionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Prediction'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {},
          child: Text('Predict Package'),
        ),
      ),
    );
  }
}

class JobOpening {
  final String id;
  final String companyId;
  final String title;
  final String ctc;
  final String description;
  bool disabled;

  JobOpening({
    required this.id,
    required this.companyId,
    required this.title,
    required this.ctc,
    required this.description,
    this.disabled = false,
  });
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

List<JobOpening> jobOpenings = [
  JobOpening(
    id: '1',
    companyId: '1',
    title: 'Software Engineer',
    ctc: '6 LPA',
    description: 'Develop and maintain software applications.',
    disabled: false,
  ),
];

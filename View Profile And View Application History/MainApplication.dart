import 'package:flutter/material.dart';

void main() {
  runApp(PlacementPortal());
}

class PlacementPortal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Placement Portal',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/profile': (context) => ProfileScreen(student: currentStudent),
        '/application-history': (context) => ApplicationHistoryScreen(applications: applications),
        // Define other routes here if necessary
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/profile');
              },
              child: Text('View Profile'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/application-history');
              },
              child: Text('View Application History'),
            ),
          ],
        ),
      ),
    );
  }
}

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
      home: CompanyListScreen(),
    );
  }
}

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final String? nama;

  const HomeScreen({Key? key, this.nama}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.yellow,
        child: Center(
          child: Text(nama ?? 'Kosong'),
        ),
      ),
    );
  }
}

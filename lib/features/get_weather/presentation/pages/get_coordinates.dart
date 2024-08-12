import 'package:flutter/material.dart';

class GetCoordinatesPage extends StatelessWidget {
  const GetCoordinatesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cari Kota'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            const Expanded(
              child: TextField(
                autofocus: true,
                decoration: InputDecoration(
                  hintText: 'Masukkan nama kota',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                // Implement search functionality here
              },
            ),
          ],
        ),
      ),
    );
  }
}

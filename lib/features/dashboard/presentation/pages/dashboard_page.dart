import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:weather_app/core/resource/resource.dart';
import 'package:weather_app/features/get_weather/presentation/pages/get_coordinates.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const GetCoordinatesPage(),
            ),
          );
        },
        child: const Icon(Icons.search),
      ),
      body: const SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              emptyIcon,
              style: TextStyle(fontSize: 50),
            ),
            Text(
              "Silahkan Pilih Kota!",
              style: TextStyle(fontSize: 30),
            ),
          ],
        ),
      ),
    );
  }
}

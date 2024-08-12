import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/dependency_injection.dart';
import 'package:weather_app/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:weather_app/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:weather_app/features/get_weather/presentation/bloc/get_weather_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DashboardBloc>(
          create: (context) => DashboardBloc(sl()),
        ),
        BlocProvider<GetWeatherBloc>(
          create: (context) => GetWeatherBloc(sl()),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const DashboardPage(),
      ),
    );
  }
}

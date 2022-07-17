import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/router/router.dart';
import 'dependency_injection.dart' as di;
import 'dependency_injection.dart';
import 'features/weather_data/presentation/cubit/weather_cubit.dart';

void main() async {
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppRouter _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<WeatherCubit>(),
      child: MaterialApp(
        title: "Weather Demo",
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: _appRouter.onGenerateRoute,
      ),
    );
  }
}

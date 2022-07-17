import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repo_test/features/weather_data/presentation/widgets/action_button.dart';
import 'package:repo_test/features/weather_data/presentation/widgets/loading_spinner.dart';
import 'package:repo_test/features/weather_data/presentation/widgets/text_display.dart';
import 'package:repo_test/features/weather_data/presentation/widgets/weather_details_text.dart';

import '../cubit/weather_cubit.dart';

class WeatherResultScreen extends StatefulWidget {
  const WeatherResultScreen({Key? key}) : super(key: key);

  @override
  State<WeatherResultScreen> createState() => _WeatherResultScreenState();
}

class _WeatherResultScreenState extends State<WeatherResultScreen> {
  late TextEditingController _locationTextController;
  @override
  void initState() {
    _locationTextController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _locationTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  "Weather",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 40,
                  ),
                ),
                _buildBody(context),
                TextField(
                  controller: _locationTextController,
                  decoration: const InputDecoration(hintText: "Type location"),
                ),
                ActionButton(
                  text: "Get typed location weather",
                  onPress: () {
                    context
                        .read<WeatherCubit>()
                        .getWeatherForLocation(_locationTextController.value.text);
                    _locationTextController.clear();
                  },
                ),
                ActionButton(
                  text: "Get random location weather",
                  onPress: () => context.read<WeatherCubit>().getWeatherForRandomLocation(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState?>(
      builder: (context, state) {
        if (state is Loading) {
          return const LoadingSpinner();
        } else if (state is Error) {
          return TextDisplay(message: state.message);
        } else if (state is Loaded) {
          return WeatherDetails(
              location: state.weather.location, temperature: state.weather.temperature);
        } else {
          return const TextDisplay(message: "Press a button to get the weather!");
        }
      },
    );
  }
}

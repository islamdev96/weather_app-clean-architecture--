// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:weather_app/weather/data/datasource/remote_data_source.dart';
import 'package:weather_app/weather/data/repository/weather_repository.dart';
import 'package:weather_app/weather/domain/repository/base_weather_repository.dart';
import 'package:weather_app/weather/domain/usecase/get_weather_by_country_name.dart';

void main() async {
  // BaseRemoteDataSource baseremoteDataSource = RemoteDataSource();
  // BaseWeatherRepository baseWeatherRepository =
  //     WeatherRepository(baseremoteDataSource);

  // await GetWeatherByCountryName(baseWeatherRepository)
  //     .execute('Egypt')
  //     .then((weather) {
  //   print(weather.cityName);
  //   print(weather.main);
  //   print(weather.id);

  //   print(weather.description);
  //   print(weather.pressure);
  // });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Center(child: MyHomePage(title: 'Weather App')),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    BaseRemoteDataSource baseremoteDataSource = RemoteDataSource();
    BaseWeatherRepository baseWeatherRepository =
        WeatherRepository(baseremoteDataSource);

    GetWeatherByCountryName(baseWeatherRepository).execute('Egypt');

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder(
          future:
              GetWeatherByCountryName(baseWeatherRepository).execute('Egypt'),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 200.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          ListTile(
                            title: Center(
                              child: Text(
                                snapshot.data!.cityName,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                            subtitle: Center(
                              child: Text(
                                snapshot.data!.main,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          ),
                          Center(
                            child: Text(
                              snapshot.data!.description,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.red,
                              ),
                            ),
                          ),
                          Center(
                            child: Text(
                              snapshot.data!.pressure.toString(),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.red,
                              ),
                            ),
                          ),
                          Center(
                            child: Text(
                              snapshot.data!.id.toString(),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  });
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}

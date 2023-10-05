// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/cupertino.dart';
import 'package:weather/additional_forecast.dart';
import 'package:weather/weather_forecast.dart';
import 'package:http/http.dart' as http;

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Future<Map<String, dynamic>> getCurrentWeather() async {
    try {
      final res = await http.get(
        Uri.parse(
            'https://api.openweathermap.org/data/2.5/forecast?q=London,uk&APPID=80558c607e200334e978697d2ccc5c3d'),
      );

      if (res.statusCode == 200) {
        final data = jsonDecode(res.body);
        if (int.parse(data['cod']) == 200) {
          return data;
        } else {
          throw "An unexpected error occurred !!";
        }
      } else {
        throw "Failed to fetch data. Status code: ${res.statusCode}";
      }
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: "Weather".text.bold.xl3.make(),
          centerTitle: true,
          actions: [
            InkWell(
                onTap: () {
                  setState(() {
                    getCurrentWeather();
                  });
                },
                child: const Icon(CupertinoIcons.refresh_thick).px12())
          ],
        ),
        body: FutureBuilder(
          future: getCurrentWeather(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            // for now i am commenting this parrt to handle the error later
            if (snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()));
            }

            final data = snapshot.data!;
            final currentWeather = data['list'][0];
            final curerntSky = currentWeather['weather'][0]['main'];
            final currentTemp = data['list'][0]['main']['temp'];
            final currentHumidity = currentWeather['main']['humidity'];
            final currentSpeed = currentWeather['wind']['speed'];
            final currentPressure = currentWeather['main']['pressure'];

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Card(
                    elevation: 14,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: SizedBox(
                      width: double.infinity,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                Text("$currentTemp K",
                                    style: const TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold)),
                                const SizedBox(
                                  height: 13,
                                ),
                                Icon(
                                  curerntSky == 'Clouds' || curerntSky == 'Rain'
                                      ? CupertinoIcons.cloud
                                      : Icons.sunny,
                                  size: 50,
                                  fill: 0.5,
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                Text(
                                  curerntSky,
                                  style: const TextStyle(fontSize: 20),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Weather ForeCast",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      )),
                  const SizedBox(
                    height: 8,
                  ),
                  // SingleChildScrollView(
                  //   scrollDirection: Axis.horizontal,
                  //   child: Row(
                  //     children: [
                  //       for (int i = 0; i < 5; i++)
                  //         Forecast(
                            
                  //           time: data['list'][i + 1]['dt_txt'].toString(),
                  //           icon: data['list'][i + 1]['main']['temp']
                  //                           .toString() ==
                  //                       'Clouds' ||
                  //                   data['list'][i + 1]['main']['temp']
                  //                           .toString() ==
                  //                       "Rain"
                  //               ? CupertinoIcons.cloud
                  //               : Icons.sunny,
                  //           temp:
                  //               data['list'][i + 1]['main']['temp'].toString(),
                  //         ),
                  //     ],
                  //   ),
                  // ),

                  ListView.builder(
                    itemCount: 5,
                    itemBuilder: (contect,index)
                    {

                    },
                  ),
                  const SizedBox(height: 20),
                  const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Additional Information",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      )),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Additional(
                          icon: CupertinoIcons.drop_fill,
                          label: "Humidity",
                          value: currentHumidity.toString()),
                      Additional(
                          icon: CupertinoIcons.wind,
                          label: "Wind Speed",
                          value: currentSpeed.toString()),
                      Additional(
                          icon: Icons.beach_access,
                          label: " Pressure",
                          value: currentPressure.toString())
                    ],
                  )
                ],
              ),
            );
          },
        ));
  }
}

import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/cupertino.dart';
import 'package:weather/additional_forecast.dart';
import 'package:weather/weather_forecast.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(useMaterial3: true),
      home: const Homepage(),
    );
  }
}

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: "Weather".text.bold.xl3.make(),
        centerTitle: true,
        actions: [
          InkWell(
              onTap: () {},
              child: const Icon(CupertinoIcons.refresh_thick).px12())
        ],
      ),
      body: Padding(
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
                    child: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Text("300.67K",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold)),
                          SizedBox(
                            height: 12,
                          ),
                          Icon(
                            CupertinoIcons.cloud_rain,
                            size: 52,
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Text(
                            "Rain",
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(
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
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                )),
            const SizedBox(
              height: 8,
            ),
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Forecast(
                    time: "00:00",
                    icon: CupertinoIcons.cloud_rain,
                    temp: "200.17K",
                  ),
                  Forecast(
                    time: "02:00",
                    icon: Icons.sunny,
                    temp: "300.34K",
                  ),
                  Forecast(
                    time: "04:00",
                    icon: CupertinoIcons.cloud,
                    temp: "400.21K",
                  ),
                  Forecast(
                    time: "06:00",
                    icon: Icons.sunny,
                    temp: "197.17K",
                  ),
                  Forecast(
                    time: "08:00",
                    icon: CupertinoIcons.cloud,
                    temp: "250.17K",
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
           const Align(
              alignment: Alignment.centerLeft,
              child: Text("Additional Information",style: TextStyle(
                fontSize: 22,fontWeight: FontWeight.bold
              ),)
              ),
             const  SizedBox(height: 12,),
         const  Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Additional(
                icon: CupertinoIcons.drop_fill,
                label: "Humidity",
                value: "95"
              ),
              Additional(
                 icon: CupertinoIcons.wind,
                label: "Wind Speed",
                value: "7.5 Kmph"
              ),
              Additional(
                 icon: Icons.beach_access,
                label: "Temperature",
                value: "1 ATM"
              )

            ],
          )
            
            
         
          ],
        ),
      ),
    );
  }
}

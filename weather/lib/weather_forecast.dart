// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Forecast extends StatelessWidget {
  final String time;
  final IconData icon;
  final String temp;

  const Forecast({
    Key? key,
    required this.time,
    required this.icon,
    required this.temp,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: Card(
        elevation: 10,
        child: Column(
          children: [
            const SizedBox(
              height: 5,
            ),
            Text(time,style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
            const SizedBox(
              height: 5,
            ),
            Icon(icon,size: 32,),
            const SizedBox(
              height: 8,
            ),
            Text(temp,style:const TextStyle(fontSize: 15),),
           const SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }
}

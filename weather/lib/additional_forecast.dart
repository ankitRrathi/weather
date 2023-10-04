// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Additional extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  const Additional({
    Key? key,
    required this.icon,
    required this.label,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
          Icon(icon,size: 35,),
          Text(label,style: TextStyle(fontSize: 16,),),
          Text(value,style: TextStyle(fontSize: 15),)
          ],
        ),
        
      
      ],
    );
  }
}

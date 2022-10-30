// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_quotes/main.dart';

class CardWidet extends StatelessWidget {
  // ignore: non_constant_identifier_names

  final BestQuotes item;
  final Function delete;
  // ignore: non_constant_identifier_names
  const CardWidet({super.key,required this.item,required this.delete});
  @override
  Widget build(BuildContext context) {
      return
     Card(
       shadowColor: Colors.amber,
       elevation: 2,
       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
       margin: const EdgeInsets.all(8),
       color: const Color.fromARGB(255, 57, 86, 151),
       child: Container(
         padding: const EdgeInsets.all(11),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.stretch,
           children: [
             Text(
               item.title,
               textDirection: TextDirection.rtl,
               style: TextStyle(fontSize: 33, color: Colors.white),
             ),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               // ignore: prefer_const_literals_to_create_immutables
               children: [
                 IconButton(
                   iconSize: 27,
                   color: Color.fromARGB(255, 255, 217, 217),
                   icon: const Icon(Icons.delete),
                   onPressed: () {
                     delete(item);
                   },
                 ),
                 Text(
                   item.author,
                   textDirection: TextDirection.rtl,
                   style: TextStyle(fontSize: 22, color: Colors.white),
                 ),
               ],
             ),
           ],
         ),
       ),
     );
  }
}

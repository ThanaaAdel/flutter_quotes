// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:ffi';

import 'package:flutter/material.dart';

import 'Widges/CardWidet.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Quotes(),
    );
  }
}

class Quotes extends StatefulWidget {
  const Quotes({Key? key}) : super(key: key);

  @override
  State<Quotes> createState() => _QuotesState();
}
//class for cards quote
class BestQuotes {
  String title;
  String author;

  BestQuotes({required this.title, required this.author});
}

class _QuotesState extends State<Quotes> {
  // create two controler to get text from textfield
   final myController = TextEditingController();
  final myController2 = TextEditingController();
      // list of quotes
  List allQuotes = [
    BestQuotes(author: "Ali Hassan", title: "رايق من نوعة فاخر 🔥"),
    BestQuotes(author: "Ali Hassan", title: "رايق من نوعة فاخر 🔥"),
    BestQuotes(author: "Ali Hassan", title: "رايق من نوعة فاخر 🔥"),
    BestQuotes(
        author: "Ali 7assan", title: "العقل السليم في البعد عن الحريم 😂"),
    BestQuotes(
        author: "Ali Elrayek",
        title: "كُتر التفكير فى الى ضااااع هيعمل لك فى دماغك صادااااع  😉 "),
    BestQuotes(
        author: "ELRAYEK",
        title: "فرح نفسك بنفسك ومتستناش حاجة حلوة من حد  ✋ "),
  ];
  // to delete card quote
  delete(BestQuotes item) {
    setState(() {
      allQuotes.remove(item);
    });
  }
  // to add new quote to the main screen in show model buttom sheet
  addnewquote(){
    setState(() {
          allQuotes.add(BestQuotes(author:myController2.text,title: myController.text),
          

          );
    });
  }

  @override
  Widget build(BuildContext context) {
     
    return Scaffold(
      
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(
                        controller: myController,
                        maxLength: 125,
                        decoration: InputDecoration(hintText: "Add New Quote : "),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextField(
                      controller: myController2,

                        maxLength: 20,
                        decoration: InputDecoration(hintText: "Add Author : "),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextButton(
                        onPressed: () {Navigator.pop(context);
                        addnewquote();
                        },
                        child: Text("add"),
                      ),
                    ],
                  ),
                );
              },
              isScrollControlled: true);
        },
        backgroundColor: Colors.redAccent,
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 50, 57, 121),
        title: Text(
          "Best Quotes",
          style: TextStyle(fontSize: 27),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: allQuotes.map((item) => CardWidet(
                // to pass item from list 
                item: item,
                // to pass delete function in card.dart
                delete: delete,
              )).toList(),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../Helpers/MyWidget.dart';

class Reglages extends StatefulWidget {
  const Reglages({Key? key}) : super(key: key);

  @override
  State<Reglages> createState() => _ReglagesState();
}

class _ReglagesState extends State<Reglages> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: Row(
        children: [
          Expanded(child:
            MyWidget(
              title:"Bienvenue sur la page des réglages !",
              canBeClosed: true,
              child: const Text(
                "Rien à régler !",
                style: TextStyle(
                    color: Colors.white
                )
              )
            )
          )
        ]
      ) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
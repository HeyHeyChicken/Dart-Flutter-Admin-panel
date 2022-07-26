import 'package:flutter/material.dart';
import '../Helpers/MyWidget.dart';

class Bugs extends StatefulWidget {
  const Bugs({Key? key}) : super(key: key);

  @override
  State<Bugs> createState() => _BugsState();
}

class _BugsState extends State<Bugs> {
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
              title:"Bienvenue sur la page des bugs !",
              canBeClosed: true,
              child: const Text(
                "Wahou ! Aucun bugs !",
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
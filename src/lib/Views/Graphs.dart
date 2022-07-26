import 'package:flutter/material.dart';
import '../Helpers/MyWidget.dart';

class Graphs extends StatefulWidget {
  const Graphs({Key? key}) : super(key: key);

  @override
  State<Graphs> createState() => _GraphsState();
}

class _GraphsState extends State<Graphs> {
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
              title:"Bienvenue sur la page des graphiques !",
              canBeClosed: true,
              child: Text(
                "Je n'ai pas eu le temps de mettre des graphiques ^^",
                style: const TextStyle(
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
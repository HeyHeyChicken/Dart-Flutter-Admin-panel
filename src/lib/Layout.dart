import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_first_flutter_app/Views/Bugs.dart';
import 'package:my_first_flutter_app/Views/Messages.dart';
import 'package:my_first_flutter_app/Views/Reglages.dart';
import 'SizeUtil.dart';
import 'Helpers/Sidenav.dart';

import 'Views/Index.dart';
import 'Views/Graphs.dart';

class Layout extends StatefulWidget {
  int pageIndex = 0;
  List<SidenavLink> links = [
    SidenavLink(icon: Icons.home, text: "Accueil", page: Index()),
    SidenavLink(icon: Icons.show_chart, text: "Graphiques", page: Graphs()),
    SidenavLink(icon: Icons.message, text: "Messages", page: Messages()),
    SidenavLink(icon: Icons.bug_report, text: "Bugs", page: Bugs()),
    SidenavLink(icon: Icons.settings, text: "Réglages", page: Reglages())
  ];

  Layout({Key? key}) : super(key: key);

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  @override
  Widget build(BuildContext context) {
    SizeUtil.size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Container(
            color: const Color(0xFFEEEEEE),
            child: Row(
              children: [
                Sidenav(
                  logo: "images/logo-white.png",
                  userName: "John W.",
                  userPicture: "images/user.jpeg",
                  links: widget.links,
                  linkIndex: widget.pageIndex,
                  layoutChangePageFunction: _changePage
                )
              ]
            )
        )
      )
    );
  }

  /// Cette fonction permet au Sidenav de changer la page.
  void _changePage(int index) {
    setState(() {
      widget.pageIndex = index;
    });
  }
}
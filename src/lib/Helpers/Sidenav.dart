import 'dart:async';

import 'package:flutter/material.dart';
import '../Views/Index.dart';

/// Lien à afficher dans un Sidenav.
class SidenavLink{
  IconData icon;
  String text;
  Widget page;

  SidenavLink({required this.icon, required this.text, required this.page});
}

/// Menu à gauche de l'écran.
class Sidenav extends StatefulWidget{
  Widget? child;
  double logoSize = 0;
  double width = 0;
  double titleHeight = 0;
  List<SidenavLink> links = [];
  String logo;
  String userName;
  String userPicture;
  final Function layoutChangePageFunction;

  int linkIndex = 0;
  double logoPadding  = 48;
  DateTime now = DateTime.now();
  List<String> weekDays = ["Lundi", "Mardi", "Mercredi", "Jeudi", "Vendredi", "Samedi", "Dimanche"];
  List<String> months = ["janvier", "février", "mars", "avril", "mai", "juin", "juillet", "août", "septembre", "octobre", "novembre", "décembre"];

  Sidenav({
    required this.logo,
    required this.userName,
    required this.userPicture,
    required this.layoutChangePageFunction,
    required this.linkIndex,
    double? logoSize,
    double? width,
    double? titleHeight,
    List<SidenavLink>? links
  }){
    this.logoSize = logoSize == null ? 32 : logoSize;
    this.width = width == null ? 80 : width;
    this.titleHeight = titleHeight == null ? 100 : titleHeight;
    this.links = links == null ? [] : links;
  }

  @override
  State<StatefulWidget> createState() {
    return _SidenavState();
  }
}

class _SidenavState extends State<Sidenav> {
  @override
  Widget build(BuildContext context){
    return Row(
      children: [
        Container(
          width: widget.width,
          height:MediaQuery.of(context).size.height,
          color: const Color(0xFF313131),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB((widget.width - widget.logoSize)/2, widget.logoPadding, (widget.width - widget.logoSize)/2, widget.logoPadding),
                child: SizedBox(
                  height: widget.logoSize,
                  width: widget.logoSize,
                  child: Image(
                    image: AssetImage(widget.logo)
                  )
                )
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height - widget.logoSize - widget.logoPadding * 2,
                child: Column(
                  children: [
                    for (int x = 0; x < widget.links.length; x++)
                      Container(
                        width: widget.width,
                        padding: const EdgeInsets.all(15),
                        child: SizedBox(
                          height:48,
                          child:Tooltip(
                            message: widget.links[x].text,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: x == widget.linkIndex ? Theme.of(context).primaryColor : Colors.transparent
                              ),
                              onPressed: () {
                                _changePage(x);
                              },
                              child: Icon(
                                widget.links[x].icon,
                                color: Colors.white,
                                size:20
                              )
                            )
                          )
                        )
                      )
                  ]
                )
              )
            ]
          )
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width - widget.width,
          child: Container(
            color: const Color(0xFF1f1f1f),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                  height: widget.titleHeight,
                  child: Row(
                    children: [
                      FittedBox(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.links[widget.linkIndex].text,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold
                              )
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.calendar_today,
                                  color: Color(0x80FFFFFF),
                                  size:12
                                ),
                                Container(
                                  padding: const EdgeInsets.fromLTRB(7, 0, 0, 0),
                                  child: Text(
                                    "${widget.weekDays[widget.now.weekday - 1]} ${widget.now.day} ${widget.months[widget.now.month - 1]} ${widget.now.year}",
                                    style: const TextStyle(
                                      color: Color(0x80FFFFFF),
                                      fontSize: 15
                                    )
                                  )
                                )
                              ]
                            )
                          ]
                        )
                      ),
                      Expanded(child: Container()),
                      FittedBox(
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image(
                                height: 48,
                                image: AssetImage(widget.userPicture)
                              )
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                              child: Text(
                                widget.userName,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20
                                )
                              )
                            )
                          ]
                        )
                      )
                    ]
                  )
                ),
                Container(
                  height: MediaQuery.of(context).size.height - widget.titleHeight,
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
                  child: widget.links[widget.linkIndex].page
                )
              ]
            )
          )
        )
      ]
    );
  }

  /// Cette fonction permet au Sidenav de changer la page.
  void _changePage(int index) {
    widget.layoutChangePageFunction(index);
  }
}
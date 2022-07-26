import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget{
  String? title;
  Widget? child;
  bool canBeClosed = false;
  bool closed = false;
  double? height;
  double? width;
  bool disableBodyTopPadding = false;

  MyWidget({String? title, Widget? child, bool? canBeClosed, double? height, double? width, bool? disableBodyTopPadding}){
    this.title = title == null ? null : title;
    this.child = child == null ? null : child;
    this.canBeClosed = canBeClosed == null ? false : true;
    this.height = height == null ? null : height;
    this.width = width == null ? null : width;
    this.disableBodyTopPadding = disableBodyTopPadding == null ? false : disableBodyTopPadding;
  }

  @override
  State<StatefulWidget> createState() {
    return _MyWidgetState();
  }
}

class _MyWidgetState extends State<MyWidget>{
  @override
  Widget build(BuildContext context){
    return widget.closed ? Container() : Container(
      height: widget.height,
      width: widget.width,
      color: const Color(0xFF1f1f1f),
      padding: const EdgeInsets.all(15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          color: const Color(0x14FFFFFF),
          child: Column(
            children: [
              widget.title == null ? Container() : Container(
                height: 58,
                padding: const EdgeInsets.fromLTRB(24, 16, 25, 16),
                child: Row(
                  children: [
                    Expanded(child:Text(
                      widget.title!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24
                      )
                    )),
                    widget.canBeClosed ? SizedBox(width: 45, child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: const Color(0xFF2e2e2e),
                        shape: const CircleBorder(),
                        padding: EdgeInsets.zero
                      ),
                      onPressed: _close,
                      child: const Icon(
                        Icons.close,
                        color: Colors.white,
                        size:20
                      )
                    )) : Container()
                  ]
                )
              ),
              Expanded(child:Container(
                padding: EdgeInsets.fromLTRB(15, widget.disableBodyTopPadding ? 0 : 15, 15, 15),
                child: widget.child
              ))
            ]
          )
        )
      )
    );
  }

  void _close() {
    setState(() {
      widget.closed = true;
    });
  }
}
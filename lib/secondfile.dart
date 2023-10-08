import 'package:flutter/material.dart';

class Mysecondscreen extends StatefulWidget {
  var ahmed;
  var data;
  var passdata;
  Mysecondscreen({this.data, this.passdata , this.ahmed,  super.key});

  //  x = x;  this.x  //ali = ahmed // this.ahmed

  @override
  State<Mysecondscreen> createState() => _MysecondscreenState();
}

class _MysecondscreenState extends State<Mysecondscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Second"),
        automaticallyImplyLeading:false   )   ,
      body: Center(child: Column(
        children: [
          Text("${widget.data}"),
          Text("${widget.passdata}"),

          ElevatedButton(onPressed: (){

            Navigator.pop(context);
          }, child: Icon(Icons.backpack))
        ],
      ),) ,

    );
  }}
import 'package:flutter/material.dart';

import 'mountaint_list.dart';

void main() => runApp(Ascend());

class Ascend extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.purple,
      ),
      home: _AscendHome('Ascend New England'),
    );
  }
}

class _AscendHome extends StatelessWidget {
  final String title;
   _AscendHome(this.title);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width  = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: Container(width: width, height: height, color: Colors.deepPurpleAccent,child: MountainList(),)
       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


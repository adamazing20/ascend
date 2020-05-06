import 'package:ascend/mnt_details_page.dart';
import 'package:ascend/mountain_list/mnt_list_bloc.dart';
import 'package:flutter/material.dart';

import 'package:ascend/mountain_list/mountaint_list.dart';

void main() => runApp(Ascend());

class Ascend extends StatelessWidget {
  // This widget is the root of your application.

  final mountainListBloc = MountainListBloc();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.purple,
      ),
      home: _AscendHome('Ascend New England', mountainListBloc: this.mountainListBloc,),
    );
  }
}

class _AscendHome extends StatelessWidget {
  final String title;
  final mountainListBloc;
   _AscendHome(this.title, {this.mountainListBloc});
   


  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width  = MediaQuery.of(context).size.width;
    return Scaffold(floatingActionButton: FloatingActionButton(child: Icon(Icons.add) ,onPressed: ()=> null,),bottomNavigationBar: BottomNavigationBar(items: const <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        title: Text('Home'),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.business),
        title: Text('Business'),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.school),
        title: Text('School'),
      ),
    ],),
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: Container(width: width, height: height, color: Colors.deepPurpleAccent,child: MountainList(mountainLisBloc: this.mountainListBloc,),)
       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


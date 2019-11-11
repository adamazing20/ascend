import 'package:ascend/mnt_details_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'mnt_list_bloc.dart';

//class MountainListInheretedWidget extends InheritedWidget {
//  final mountainListBlock = MountainListBloc();
//
//  MountainListBloc get mountainList => mountainListBlock;
//
//
//  MountainListInheretedWidget({Key key, @required Widget child}): super(key: key, child: child);
//
//  @override
//  bool updateShouldNotify(InheritedWidget oldWidget) => true;
//
//  static MountainListInheretedWidget of(BuildContext context) =>
//      context.inheritFromWidgetOfExactType(MountainListInheretedWidget)
//          as MountainListInheretedWidget;
//}

class MountainList extends StatefulWidget {
  final mountainLisBloc;

  MountainList({this.mountainLisBloc});

  @override
  State<StatefulWidget> createState() {
    return _MountainListState();
  }
}

class _MountainListState extends State<MountainList> {

  List<Widget> getMountainCards(context, List<String> name) {
    var names = [];
    names.addAll(name);

    var cardsList = <Widget>[];

    cardsList = names
        .map((f) => Card(
      child: Row(children: [
        Hero(
            tag: "details$f",
            child: GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MountainDetailsPage(f))),
                child: FlutterLogo(
                  size: 200,
                ))),
        Column(
          children: <Widget>[
            Text(f),
            Padding(
              padding: EdgeInsets.all(25),
            ),
            Text("Elevation: ")
          ],
        )
      ]),
    ))
        .toList();

    return cardsList;
  }


  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: widget.mountainLisBloc.words,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return CircularProgressIndicator();
        }

        return Column(
          children: <Widget>[
            NewMountainRow(widget.mountainLisBloc),
            Expanded(
              child: ListView(
                children: getMountainCards(context, snapshot.data),
              ),
            )
          ],
        );
      },
    );
  }
}

class NewMountainRow extends StatelessWidget {
  final nameController = TextEditingController();

  final MountainListBloc mountainListBloc;

  NewMountainRow(this.mountainListBloc);


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: nameController,
          ),
        ),
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () {
            mountainListBloc.wordsSink.add(nameController.text);
            nameController.clear();
          },
        )
      ],
    );
  }
}

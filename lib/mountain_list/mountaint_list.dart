import 'package:ascend/mnt_details_page.dart';
import 'package:ascend/mountain_list/mountain_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:ascend/mountain_list/mnt_list_bloc.dart';

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

    cardsList = names.map((name) => MountainCard(name: name)).toList();

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

//Temporay row used to demo state.

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

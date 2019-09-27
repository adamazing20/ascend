import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MountainList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: getMountainCards(),
    );
  }

  List<Widget> getMountainCards() {
    var names = ["Mountain1", "Mountian2", "Mountain3", "Mountain4"];

    var cardsList = [];

    cardsList = names
        .map((f) => Card(
              child: Row(children: [
                FlutterLogo(
                  size: 200,
                ),
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
}

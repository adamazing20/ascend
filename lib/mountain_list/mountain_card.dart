import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../mnt_details_page.dart';

class MountainCard extends StatelessWidget {
  final String name;

  MountainCard({@required this.name});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(children: [
        Hero(
            tag: "details$name",
            child: GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MountainDetailsPage(name))),
                child: FlutterLogo(
                  size: 200,
                ))),
        Column(
          children: <Widget>[
            Text(name),
            Padding(
              padding: EdgeInsets.all(25),
            ),
            Text("Elevation: ")
          ],
        )
      ]),
    );
  }
}

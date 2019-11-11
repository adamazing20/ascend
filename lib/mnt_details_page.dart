import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MountainDetailsPage extends StatelessWidget {
  var mntName;

  MountainDetailsPage(this.mntName);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(),
      body: Container(
        child: Hero(
          tag: "details$mntName",
          child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FlutterLogo(size: 200),
                  Container(
                    child: Flexible(fit: FlexFit.loose,
                      child: Card(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              mntName,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}

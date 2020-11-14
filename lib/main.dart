import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:surf_work_shop/cities_list.dart';

const flrSplashLogo = 'res/flare/flr_splash_logo.flr';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Container(
        color: Colors.blue,
        child: Builder(
          builder: (context) {
            return FlareActor(
              flrSplashLogo,
              animation: 'Untitled',
              callback: (name) {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => CitiesListWidget()));
              },
            );
          },
        ),
      ),
    );
  }
}

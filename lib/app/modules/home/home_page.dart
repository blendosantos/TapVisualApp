import 'package:flutter/material.dart';
import 'package:tap_visual_app/app/app_module.dart';
import 'package:tap_visual_app/app/modules/home/home_bloc.dart';
import 'package:tap_visual_app/app/modules/home/home_module.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final bloc = HomeModule.to.getBloc<HomeBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text( "Home"),
      ),
      body: Column(
        children: <Widget>[
          Center(
            child: RaisedButton(onPressed: () async {
              await bloc.logoff();
              Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => AppModule()));
            }, child: Text("Logoff"),),
          )
        ],
      ),
    );
  }
}

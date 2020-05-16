import 'package:flutter/material.dart';

void showInSnackBar(
    GlobalKey<ScaffoldState> _scaffoldKey, String value, bool type) {
  _scaffoldKey.currentState?.removeCurrentSnackBar();
  _scaffoldKey.currentState.showSnackBar(SnackBar(
    content: Text(
      value,
      textAlign: TextAlign.center,
      style: TextStyle(
          color: Colors.white, fontSize: 16.0, fontFamily: "WorkSansSemiBold"),
    ),
    backgroundColor: (type ? Colors.green[900] : Colors.red[900]),
    duration: Duration(seconds: 5),
  ));
}

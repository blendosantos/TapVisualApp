import 'package:flutter/material.dart';
import 'package:tap_visual_app/app/app_bloc.dart';
import 'package:tap_visual_app/app/app_module.dart';
import 'package:tap_visual_app/app/modules/home/home_module.dart';
import 'package:tap_visual_app/app/modules/login/abertura/abertura_module.dart';
import 'package:tap_visual_app/theme/custom_theme.dart';

class AppWidget extends StatefulWidget {
  AppWidget({Key key}) : super(key: key);

  @override
  _AppWidgetState createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  var appBloc = AppModule.to.getBloc<AppBloc>();
  Widget homePage = Container();

  @override
  void initState() {
    super.initState();
    isUsuarioLogin();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tap Visual',
      theme: appThemData['Ligth'],
      darkTheme: appThemData['Dark'],
      home: homePage,
    );
  }

  Future<dynamic> isUsuarioLogin() async {
    var r = await appBloc.isUsuario();
    if (r) {
      setState(() {
        homePage = HomeModule();
      });
    } else {
      setState(() {
        homePage = AberturaModule();
      });
    }
  }
}

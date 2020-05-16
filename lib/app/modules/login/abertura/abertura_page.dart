import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:tap_visual_app/app/modules/login/login_module.dart';
import 'package:tap_visual_app/app/shared/btn/btnNav_widget.dart';
import 'package:tap_visual_app/theme/custom_theme.dart';

class AberturaPage extends StatefulWidget {
  final String title;
  const AberturaPage({this.title = "Abertura"});

  @override
  _AberturaPageState createState() => _AberturaPageState();
}

class _AberturaPageState extends State<AberturaPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: CustomColors.laranja,
        body: Container(
          width: size.width,
          height: size.height,
          child: Column(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(top: size.height * 0.15),
                  child: Container(
                    height: size.height * 0.25,
                    child: FlareActor('assets/flare.flr', animation: 'abertura'),
                  )),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Text("Bem-vindo ao TapVisual",
                    style: TextStyle(
                        fontSize: size.width * 0.05,
                        fontWeight: FontWeight.bold,
                        color: CustomColors.preto)),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.13),
                child: Text(
                    "Localize barbeiros em sua região e venha ter uma experiência visual diferenciada ou se torne um dos barbeiros e aumente sua rede de clientes",
                    style: TextStyle(
                        fontSize: size.width * 0.03,
                        color: CustomColors.cinza500),
                    textAlign: TextAlign.center),
              ),
              Container(
                width: size.width,
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  alignment: WrapAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      width: size.width * 0.30,
                      margin: EdgeInsets.only(
                          left: size.width * 0.15, top: size.height * 0.19),
                      child: Image.asset('assets/img/logo/preto.png')
                    ),
                    Container(
                      margin: EdgeInsets.only(top: size.height * 0.23),
                      width: size.width * 0.20,
                      child: GestureDetector(
                        onTap: () async {
                              await Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          LoginModule()));
                            },
                        child: BtnNavWidget(Icons.navigate_next)
                        ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

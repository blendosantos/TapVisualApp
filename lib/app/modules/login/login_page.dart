import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:tap_visual_app/app/modules/home/home_module.dart';
import 'package:tap_visual_app/app/modules/login/login_bloc.dart';
import 'package:tap_visual_app/app/modules/login/login_module.dart';
import 'package:tap_visual_app/app/shared/InSnackBar.dart';
import 'package:tap_visual_app/app/shared/StatusState.dart';
import 'package:tap_visual_app/app/shared/btn/btnAction_widget.dart';
import 'package:tap_visual_app/app/shared/input/input_widget.dart';
import 'package:tap_visual_app/theme/custom_theme.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key key, this.title = "Login"}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _bloc = LoginModule.to.getBloc<LoginBloc>();

  TextEditingController _mailController;
  TextEditingController _pwController;

  GlobalKey<ScaffoldState> _scaffoldKey;

  @override
  void initState() {
    super.initState();

    _scaffoldKey = GlobalKey<ScaffoldState>();

    _mailController = TextEditingController();
    _pwController = TextEditingController();

    _mailController.text = "";
    _pwController.text = "";

    _bloc.outState.listen((event) {
      if (event == StatusDefault.NOTFOUND) {
        showInSnackBar(_scaffoldKey, "Usuário ou senha inválido", false);
      } else if (event == StatusDefault.SUCCESS) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => HomeModule()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: CustomColors.preto,
        body: Container(
          width: size.width,
          height: size.height,
          child: StreamBuilder<StatusDefault>(
            initialData: StatusDefault.IDLE,
            stream: _bloc.outState,
            builder: (context, snapshot) {
              if (snapshot.data == StatusDefault.LOADING) {
                return Center(
                      child: FlareActor(
                    "assets/flare.flr",
                    animation: "loading",
                  ));
              }
              return _buildColumn(size, context);
            }
          ),
        ),
      ),
    );
  }

  Widget _buildColumn(Size size, BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
            height: size.height * 0.40,
            padding: EdgeInsets.only(top: size.height * 0.10),
            alignment: Alignment.center,
            child: Image.asset('assets/img/logo/branco.png',
                alignment: Alignment.center, width: size.width * 0.40)),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: InputWidget(
              controller: _mailController,
              icon: Icons.mail_outline,
              label: "Email"),
        ),
        InputWidget(
            controller: _pwController,
            icon: Icons.lock_outline,
            label: "Senha",
            obscure: true),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: GestureDetector(
            child: BtnActionWidget("Entrar"),
            onTap: () async {
              await _bloc.submitLogin(_mailController.text, _pwController.text);
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: GestureDetector(
            child: Text("Esqueceu a senha?",
                style: TextStyle(fontSize: 14, color: CustomColors.cinza100)),
            onTap: () {},
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:tap_visual_app/theme/custom_theme.dart';

class BtnActionWidget extends StatelessWidget {

  final String titulo;

  const BtnActionWidget(this.titulo, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.06,
      width: size.width * 0.7,
      decoration: BoxDecoration(
        color: CustomColors.laranja,
        borderRadius: BorderRadius.circular(15.00),
      ),
      child: Center(
        child: Text(this.titulo, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
        ),
    );
  }
}

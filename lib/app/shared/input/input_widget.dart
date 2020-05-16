import 'package:flutter/material.dart';
import 'package:tap_visual_app/theme/custom_theme.dart';

class InputWidget extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final IconData icon;
  final bool enable;
  final bool obscure;

  const InputWidget(
      {Key key,
      this.controller,
      this.label,
      this.icon,
      this.enable = true,
      this.obscure = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.055,
      width: size.width * 0.7,
      decoration: BoxDecoration(
        color: CustomColors.cinza100,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: TextField(
          controller: this.controller,
          style: TextStyle(color: Colors.white, fontSize: 18),
          obscureText: this.obscure,
          enabled: this.enable,
          decoration: InputDecoration(
              hintText: this.label,
              hintStyle: TextStyle(fontSize: 18),
              enabled: this.enable,
              enabledBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              prefixIcon: Icon(this.icon,
                  size: size.width * 0.06, color: CustomColors.cinza500)),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:tap_visual_app/theme/custom_theme.dart';

class BtnNavWidget extends StatelessWidget {

  final IconData icon;
  final double sizeIcon;
  final Color colorIcon;
  final bool inverse;

  const BtnNavWidget(this.icon, {Key key, this.sizeIcon = 40, this.colorIcon = Colors.white, this.inverse = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    double radiusInverse = (this.inverse ? 0 : 20);
    double radius = (this.inverse ? 20 : 0);

    return Container(
      height: size.height*0.08,
      width: size.width*0.15,
      decoration: BoxDecoration(
        color: this.inverse ? CustomColors.laranja : CustomColors.preto,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(radiusInverse),
          bottomLeft: Radius.circular(radiusInverse),

          bottomRight: Radius.circular(radius),
          topRight: Radius.circular(radius),
        ),
      ),
      child: Icon(this.icon, size: this.sizeIcon, color: this.colorIcon,),
    );
  }
}

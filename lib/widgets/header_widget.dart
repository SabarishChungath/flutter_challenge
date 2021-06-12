import 'package:flutter/material.dart';

Widget headerRow(
    {IconData rightIcon,
    double rightIconSize,
    Function onPressBack,
    Function onPressRightIcon,
    @required String title,
    Color iconBgColor,
    Color iconBorderColor,
    bool isCart = false,
    @required BuildContext context}) {
  return PreferredSize(
    preferredSize: Size.fromHeight(80.0),
    child: Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 10.0,
      ),
      child: Row(
        children: [
          headerButton(
              icon: Icons.chevron_left,
              borderColor: Colors.white,
              iconSize: 30,
              onPress: () => Navigator.of(context).maybePop()),
        ],
      ),
    ),
  );
}

Widget headerButton({
  IconData icon,
  Color bgColor,
  Color borderColor,
  double iconSize,
  Color iconColor,
  Function onPress,
}) {
  return GestureDetector(
    onTap: onPress,
    child: Container(
      width: 44.19,
      height: 44.19,
      decoration: BoxDecoration(
        color: bgColor,
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      child: Icon(
        icon,
        size: iconSize,
        color: iconColor,
      ),
    ),
  );
}

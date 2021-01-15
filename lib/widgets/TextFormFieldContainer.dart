import 'package:flutter/material.dart';

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  const TextFieldContainer({
    Key key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      // margin: EdgeInsets.symmetric(vertical: 5),
      width: 130,
      decoration: BoxDecoration(
        color: Color(0xFFDEDEDE),
        borderRadius: BorderRadius.circular(29),
      ),
      child: child,
    );
  }
}

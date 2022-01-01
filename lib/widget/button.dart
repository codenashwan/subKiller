import 'package:flutter/material.dart';
import 'package:subdomain/widget/text.dart';

class SButton extends StatelessWidget {
  final title;
  final bool isStart;
  final GestureTapCallback? onTap;

  const SButton(
      {Key? key, this.onTap, this.title = "title", this.isStart = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            colors: isStart
                ? [
                    Color(0xffc31432),
                    Color(0xff240b36),
                  ]
                : [
                    Colors.orange,
                    Colors.red,
                  ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, 0),
              blurRadius: 2,
            ),
          ],
        ),
        child: Center(
          child: SText(
            maxlines: 3,
            title: title,
            color: Colors.white,
            fontWeight: FontWeight.bold,
            size: 18.0,
          ),
        ),
      ),
    );
  }
}

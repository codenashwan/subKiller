import 'package:flutter/material.dart';
import 'package:subdomain/widget/text.dart';

class SHeader extends StatelessWidget {
  const SHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Image.asset(
            'assets/img/logo.png',
            height: 100,
            width: 100,
            fit: BoxFit.cover,
          ),
        ),
        Expanded(
          flex: 7,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SText(
                title: "SUB KILLER",
                fontWeight: FontWeight.bold,
                size: 25.0,
              ),
              SizedBox(
                height: 10,
              ),
              SText(
                title:
                    "SubKiller is a app that allows you to find SubDomain Websites.",
                fontWeight: FontWeight.bold,
                size: 14.0,
                maxlines: 3,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

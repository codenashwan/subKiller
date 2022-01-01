import 'package:flutter/material.dart';
import 'package:subdomain/widget/text.dart';

class SGrid extends StatelessWidget {
  final title, value;
  const SGrid({
    Key? key,
    this.title = "title",
    this.value = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 0),
            blurRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SText(
            title: title.toString(),
            maxlines: 3,
            color: Colors.deepOrangeAccent,
            fontWeight: FontWeight.bold,
            size: 15.0,
          ),
          SizedBox(
            height: 10,
          ),
          SText(
            title: value.toString(),
            color: Colors.black,
            fontWeight: FontWeight.bold,
            size: 20.0,
          ),
        ],
      ),
    );
  }
}

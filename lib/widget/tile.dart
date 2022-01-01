import 'package:flutter/material.dart';
import 'package:subdomain/widget/text.dart';

class STile extends StatelessWidget {
  final domain, statuscode, link;
  const STile({
    Key? key,
    this.domain = "www.google.com",
    this.statuscode = "400",
    this.link = "https://www.google.com",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      tileColor: Color(0xffF5F5F5),
      trailing: IconButton(
        icon: Icon(
          Icons.link,
          color: Colors.orange,
        ),
        onPressed: () {},
      ),
      title: SText(
        title: domain.toString(),
      ),
      subtitle: Text("Status Code : " + statuscode.toString()),
    );
  }
}

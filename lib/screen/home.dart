import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:subdomain/models/Mhome.dart';
import 'package:subdomain/widget/button.dart';
import 'package:subdomain/widget/grid.dart';
import 'package:subdomain/widget/header.dart';
import 'package:subdomain/widget/input.dart';
import 'package:subdomain/widget/text.dart';
import 'package:subdomain/widget/tile.dart';
import 'package:intl/intl.dart' as intl;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final formatter = intl.NumberFormat.decimalPattern();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Consumer<Mhome>(
          builder: (context, value, child) {
            return ListView(
              padding: EdgeInsets.all(16.0),
              children: [
                SHeader(),
                SizedBox(
                  height: 20,
                ),
                SText(
                  title:
                      "Before you scan subdomains you need to close all programs that are working",
                  maxlines: 5,
                ),
                SizedBox(
                  height: 20,
                ),
                SInput(
                  textController: value.search,
                  hint: "domain.com",
                ),
                GridView(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 10,
                    childAspectRatio: 1.9,
                  ),
                  scrollDirection: Axis.vertical,
                  children: [
                    SGrid(
                      title: "Subdomain",
                      value: formatter
                          .format(value.countFileInt() - (value.count + 1)),
                    ),
                    SGrid(
                      title: "Start at",
                      value: value.count + 1,
                    ),
                    SGrid(
                      title: "Found subdomains",
                      value: value.result.length,
                    ),
                    SButton(
                      onTap: () {
                        value.isStart ? value.stop() : value.start();
                      },
                      title: value.isStart ? "Stop" : "Start Scan",
                      isStart: value.isStart,
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                value.isStart
                    ? SText(
                        title: "Searching for " +
                            value.url(value.data.split('\n')[value.count],
                                value.search.text),
                        fontWeight: FontWeight.bold,
                      )
                    : SizedBox(
                        height: 10,
                      ),
                SizedBox(
                  height: 10,
                ),
                for (var i = 0; i < value.result.length; i++)
                  STile(
                    domain: value.result[i]['url'],
                    statuscode: value.result[i]['status'],
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}

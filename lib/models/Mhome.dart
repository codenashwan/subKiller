import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:intl/intl.dart' as intl;

class Mhome extends GetConnect with ChangeNotifier {
  final formatter = intl.NumberFormat.decimalPattern();
  TextEditingController search = TextEditingController();

  String data = '';
  int count = 0;
  bool isStart = false;
  List result = [];
  Mhome() {
    fetchdata();
  }

  int countFileInt() {
    return data.split('\n').length;
  }

  fetchdata() async {
    String response;
    response = await rootBundle.loadString('assets/file.txt');
    data = response;
    notifyListeners();
  }

  String clearText(str) {
    return str
        .replaceAll(new RegExp(r"\s+\b|\b\s"), "")
        .toLowerCase()
        .toString();
  }

  String url(str1, str2) {
    return 'https://${clearText(str1)}.${clearText(str2)}';
  }

  Future start() async {
    if (search.text.isNotEmpty) {
      List<String> listsubs = data.split('\n');
      isStart = true;
      for (var i = count; i <= countFileInt(); i++) {
        if (countFileInt() - 1 == i) {
          isStart = false;
          count = 0;
          search.clear();
          break;
        }
        var response = await get(url(listsubs[i], search.text));
        if (response.statusCode == 200 ||
            response.statusCode == 301 ||
            response.statusCode == 403) {
          result.add({
            'url': url(listsubs[i], search.text),
            'status': response.statusCode.toString(),
          });
        }
        count = i;
        notifyListeners();
        await Future.delayed(Duration(seconds: 1));
        if (isStart == false || countFileInt() - 1 == i) {
          isStart = false;
          break;
        }
        notifyListeners();
      }
    } else {
      Get.snackbar("Required", "Please fill the search field",
          snackPosition: SnackPosition.BOTTOM);
      isStart = false;
      notifyListeners();
    }
  }

  Future stop() async {
    isStart = false;
    notifyListeners();
  }
}

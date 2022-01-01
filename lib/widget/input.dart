import 'package:flutter/material.dart';

class SInput extends StatelessWidget {
  final TextEditingController textController;
  final String hint;
  final Function(String)? onChanged;
  final EdgeInsets padding;
  final TextInputType keyboardType;
  const SInput({
    Key? key,
    required this.textController,
    this.hint = "Search",
    this.onChanged,
    this.padding = const EdgeInsets.symmetric(vertical: 10),
    this.keyboardType = TextInputType.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      child: TextFormField(
        onChanged: onChanged,
        controller: textController,
        keyboardType: keyboardType,
        obscureText:
            keyboardType == TextInputType.visiblePassword ? true : false,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(
            fontFamily: 'Lato',
            color: Colors.black54,
            fontSize: 14,
            fontWeight: FontWeight.normal,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xffededed),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xffededed),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          contentPadding: EdgeInsetsDirectional.fromSTEB(20, 24, 0, 24),
        ),
        style: TextStyle(
          fontFamily: 'Lato',
          color: Color(0xFF14181B),
          fontSize: 18,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }
}

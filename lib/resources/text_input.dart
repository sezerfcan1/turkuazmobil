import 'package:flutter/material.dart';
import 'palette.dart';

class TextInput extends StatelessWidget {
  const TextInput({
    Key key,
    @required this.icon,
    @required this.hint,
    @required this.inputString,
    this.inputType,
    this.inputAction,
  }) : super(key: key);

  final IconData icon;
  final String hint;
  final TextInputType inputType;
  final TextInputAction inputAction;
  final TextEditingController inputString;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Container(
        decoration: BoxDecoration(
          color: color2,
          borderRadius: BorderRadius.circular(16),
        ),
        child: TextField(
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 20),
            border: InputBorder.none,
            hintText: hint,
            prefixIcon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Icon(
                icon,
                color: Colors.black,
                size: 30,
              ),
            ),
            hintStyle: kBodyText,
          ),
          style: kBodyText,
          keyboardType: inputType,
          textInputAction: inputAction,
          controller: inputString,
        ),
      ),
    );
  }
}


class TextInputObs extends StatelessWidget {
  const TextInputObs({
    Key key,
    @required this.hint,
    @required this.inputString,
    this.inputType,
    this.inputAction,
  }) : super(key: key);

  final String hint;
  final TextInputType inputType;
  final TextInputAction inputAction;
  final TextEditingController inputString;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Container(
        decoration: BoxDecoration(
          color: color2,
          borderRadius: BorderRadius.circular(16),
        ),
        child: TextField(
          obscureText: true,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 20),
            border: InputBorder.none,
            hintText: hint,
            prefixIcon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
            ),
            hintStyle: kBodyText,
          ),
          style: kBodyText,
          keyboardType: inputType,
          textInputAction: inputAction,
          controller: inputString,
        ),
      ),
    );
  }
}
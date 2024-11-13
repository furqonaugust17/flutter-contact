import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({super.key, required this.title, required this.onPress});
  final String title;
  final Function() onPress;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPress,
        child: Text(
          title,
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        style: ButtonStyle(
            padding: WidgetStatePropertyAll(EdgeInsets.all(10)),
            shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)))),
            backgroundColor: WidgetStatePropertyAll(Colors.green.shade300)),
      ),
    );
  }
}

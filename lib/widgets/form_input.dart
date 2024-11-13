import 'package:flutter/material.dart';

class FormInput extends StatelessWidget {
  const FormInput(
      {super.key,
      required this.icon,
      required this.label,
      required this.onChanged});
  final IconData icon;
  final String label;
  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextFormField(
        obscureText: label == "password",
        decoration: InputDecoration(
            label: Text(label),
            suffixIcon: Icon(icon),
            fillColor: Colors.white,
            filled: true,
            border: const OutlineInputBorder(borderSide: BorderSide.none)),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "$label tidak boleh kosong";
          }
          return null;
        },
        onChanged: onChanged,
      ),
    );
  }
}

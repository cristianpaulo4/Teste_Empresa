import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  final String label;
  final String erro;
  final TextEditingController controller;
  final TextInputType type;
  const Input({Key key, this.label, this.controller, this.erro, this.type})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: TextFormField(
        keyboardType: type,
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          hintText: label,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.grey.shade200,
        ),
        validator: (x) {
          if (x.isEmpty) {
            return erro;
          }
        },
      ),
    );
  }
}

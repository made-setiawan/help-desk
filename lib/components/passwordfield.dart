// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class MyTextFieldCust extends StatefulWidget {
  final TextEditingController controllerText;
  final String labelText;
  final IconData suffixIcon;
  final String? Function(String?)? validator;

  const MyTextFieldCust({
    Key? key,
    required this.controllerText,
    required this.labelText,
    required this.suffixIcon,
    this.validator,
  }) : super(key: key);

  @override
  State<MyTextFieldCust> createState() => _MyTextFieldCustState();
}

class _MyTextFieldCustState extends State<MyTextFieldCust> {
  bool _obscureText = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controllerText,
      obscureText: _obscureText,
      decoration: InputDecoration(
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        fillColor: Colors.grey.shade200,
        filled: true,
        hintText: widget.labelText,
        hintStyle: TextStyle(color: Colors.grey[500]),
        // labelText: widget.labelText,
        suffixIcon: widget.suffixIcon == Icons.visibility
            ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              )
            : Icon(widget.suffixIcon),
      ),
      validator: widget.validator,
    );
  }
}

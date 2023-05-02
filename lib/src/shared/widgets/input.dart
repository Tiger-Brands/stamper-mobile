import 'package:flutter/material.dart';

class Input extends StatefulWidget {
  const Input({
    super.key,
    required this.label,
    this.hint = '',
    this.validator,
    this.isActive,
    required this.controller,
    this.keyboardType,
    this.obscureText = false,
    this.prefix,
    this.suffix,
  });
  final String label;
  final String hint;
  final Widget? prefix;
  final Widget? suffix;
  final bool? isActive;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final bool obscureText;

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: TextFormField(
        validator: widget.validator,
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        obscureText: widget.obscureText,
        decoration: InputDecoration(
          enabled: widget.isActive ?? true,
          prefixIcon: widget.prefix,
          suffixIcon: widget.suffix,
          label: Text(widget.label),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
          hintText: widget.hint,
        ),
      ),
    );
  }
}

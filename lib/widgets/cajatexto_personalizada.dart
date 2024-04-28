import 'package:flutter/material.dart';

class CajaTextoPersonalizada extends StatelessWidget {
  final String? label;
  final String? hint;
  final String? errorMessage;
  final bool obscureText;
  final IconData icono;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;

  const CajaTextoPersonalizada({
    super.key,
    this.label,
    this.hint,
    this.errorMessage,
    this.obscureText = false,
    this.onChanged,
    this.validator,
    required this.icono,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    final border = OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.black45),
        borderRadius: BorderRadius.circular(10));

    return TextFormField(
      onChanged: onChanged,
      validator: validator,
      obscureText: obscureText,
      decoration: InputDecoration(
          enabledBorder: border,
          focusedBorder: border.copyWith(
              borderSide: const BorderSide(color: Colors.black45)),
          errorBorder: border.copyWith(
              borderSide: BorderSide(color: Colors.red.shade800)),
          focusedErrorBorder: border.copyWith(
              borderSide: BorderSide(color: Colors.red.shade800)),
          isDense: true,
          label: label != null ? Text(label!) : null,
          labelStyle: const TextStyle(
              color: Colors.black45, fontWeight: FontWeight.normal),
          hintText: hint,
          errorText: errorMessage,
          focusColor: colors.primary,
          suffixIcon: Icon(icono)),
    );
  }
}
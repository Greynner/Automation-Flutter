import 'package:flutter/material.dart';
import 'package:my_vault/common/constants.dart';

class RoundedTextFormField extends StatelessWidget {
  const RoundedTextFormField({
    Key? key,
    required this.hintText,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.controller,
  })  : fieldKey = key,
        super();
  final Key? fieldKey;
  final TextEditingController? controller;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final String hintText;
  final bool obscureText;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(left: 16),
      width: size.width * 0.9,
      decoration: BoxDecoration(
        color: kTextFieldBackgroundColor,
        borderRadius: BorderRadius.circular(29),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: TextFormField(
          key: fieldKey,
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            suffixIcon: suffixIcon != null ? Icon(suffixIcon) : null,
            icon: prefixIcon != null
                ? Icon(
                    prefixIcon,
                    color: kPrimaryColor,
                  )
                : null,
            hintText: hintText,
            fillColor: kTextFieldBackgroundColor,
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}

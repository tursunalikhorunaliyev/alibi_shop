import 'package:alibi_shop/values/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegisterTextField extends StatefulWidget {
  final String labelText;
  final String hintext;
  final bool isPassword;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  const RegisterTextField({
    super.key,
    required this.labelText,
    required this.hintext,
    this.isPassword = false,
    this.controller,
    this.onChanged,
  });

  @override
  State<RegisterTextField> createState() => _RegisterTextFieldState();
}

class _RegisterTextFieldState extends State<RegisterTextField> {
  bool isPassOn = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.labelText,
          style: AppFonts.bb2Medium,
        ),
        const SizedBox(height: 6),
        TextField(
          onChanged: widget.onChanged,
          controller: widget.controller,
          obscureText: isPassOn,
          obscuringCharacter: "●",
          decoration: InputDecoration(
            fillColor: const Color(0xFFFAFAFA),
            filled: true,
            suffixIcon: widget.isPassword
                ? InkWell(
                    onTap: () {
                      isPassOn = !isPassOn;
                      setState(() {});
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: SvgPicture.asset(
                        isPassOn
                            ? "assets/icons/eye.svg"
                            : "assets/icons/Password-Outline.svg",
                      ),
                    ),
                  )
                : null,
            hintText: widget.hintext,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}

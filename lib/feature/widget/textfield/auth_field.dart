import 'package:alibi_shop/generated/assets.dart';
import 'package:alibi_shop/values/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class AuthField extends StatefulWidget {
  final String? leadingIcon;
  final String? trailingIcon;
  final String floatingText;
  final String hintText;
  final bool isPasswordField;
  final MaskTextInputFormatter? maskTextInputFormatter;
  final VoidCallback? trailingAction;
  final TextInputType? textInputType;

  const AuthField({
    Key? key,
    this.leadingIcon,
    this.trailingIcon,
    required this.floatingText,
    required this.hintText,
    this.isPasswordField = false,
    this.maskTextInputFormatter,
    this.trailingAction,
    this.textInputType,
  }) : super(key: key);

  @override
  State<AuthField> createState() => _AuthFieldState();
}

class _AuthFieldState extends State<AuthField> {
  bool showPass = false;

  @override
  void initState() {
    showPass = widget.isPasswordField ?? true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.floatingText,
          style: AppFonts.bb2Medium,
        ),
        SizedBox(height: 6.h),
        Container(
          height: 56.h,
          padding: EdgeInsets.symmetric(
            horizontal: 12.h,
            vertical: 12.h,
          ),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: const Color(0xFFFAFAFA),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  widget.leadingIcon != null
                      ? SvgPicture.asset(widget.leadingIcon!)
                      : const SizedBox(),
                  widget.leadingIcon != null
                      ? SizedBox(width: 16.h)
                      : const SizedBox(),
                  SizedBox(
                    width: 280.w,
                    child: TextField(
                      inputFormatters: widget.maskTextInputFormatter == null
                          ? []
                          : [widget.maskTextInputFormatter!],
                      obscureText: showPass,
                      keyboardType: widget.textInputType,
                      decoration: InputDecoration(
                        hintText: widget.hintText,
                        hintStyle: AppFonts.bb1Regular.copyWith(
                          color: const Color(0xFF59616C),
                        ),
                        contentPadding: EdgeInsets.zero,
                        border: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              widget.trailingIcon != null
                  ? widget.isPasswordField
                      ? InkWell(
                          onTap: () {
                            showPass = !showPass;
                            setState(() {});
                          },
                          child: SvgPicture.asset(showPass == false
                              ? Assets.iconsHide
                              : Assets.iconsShow),
                        )
                      : SvgPicture.asset(widget.trailingIcon!)
                  : const SizedBox()
            ],
          ),
        ),
      ],
    );
  }
}

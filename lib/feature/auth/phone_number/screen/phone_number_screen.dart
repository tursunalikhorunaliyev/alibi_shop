import 'package:alibi_shop/feature/widget/textfield/auth_field.dart';
import 'package:flutter/material.dart';

class PhoneNumberScreen extends StatefulWidget {
  static const String routeName = "/phone_number_screen";
  const PhoneNumberScreen({Key? key}) : super(key: key);

  @override
  State<PhoneNumberScreen> createState() => _PhoneNumberScreenState();
}

class _PhoneNumberScreenState extends State<PhoneNumberScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: AuthField(),
        ),
      ),
    );
  }
}

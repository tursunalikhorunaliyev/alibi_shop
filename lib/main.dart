import 'package:alibi_shop/app.dart';
import 'package:alibi_shop/service/init/init.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  WidgetsFlutterBinding.ensureInitialized();
  init();
  runApp(const MyApp());
}

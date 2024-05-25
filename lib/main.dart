import 'package:adept_labz_test/locator/locate.dart';
import 'package:adept_labz_test/main_adept_labz_test.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  runApp(const MainAdeptLabzTest());
}

import 'package:flutter/material.dart';
import 'package:re_mind_case/views/bill_info/bill_info.dart';
import 'locator.dart';

void main() {
  setupLocator();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MediaQuery(
      data: MediaQueryData(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'reMind Case',
          home: BillInfo()),
    );
  }
}

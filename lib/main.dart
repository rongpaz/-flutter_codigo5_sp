import 'package:flutter/material.dart';
import 'package:flutter_codigo5_sp/pages/counter_page.dart';
import 'package:flutter_codigo5_sp/pages/home_page.dart';
import 'package:flutter_codigo5_sp/utils/sp_global.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SPGlobal prefx = SPGlobal();
  await prefx.initShared();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
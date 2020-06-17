import 'package:flutter/material.dart';
import 'package:fluttermvvm/view/home_page.dart';
import 'package:fluttermvvm/view/log_in_page.dart';
import 'package:fluttermvvm/viewModel/home_view_model.dart';
import 'package:fluttermvvm/viewModel/log_in_view_model.dart';
import 'package:property_change_notifier/property_change_notifier.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
//    return MaterialApp(
//      debugShowCheckedModeBanner: false,
//      title: 'Flutter Demo',
//      theme: ThemeData(
//        primarySwatch: Colors.blue,
//      ),
////      home: LogInPage(),
//      home: ChangeNotifierProvider(
//        create: (context) => LogInViewModel(),
//        child: LogInPage(),
//      )
//    return ChangeNotifierProvider(
//      create: (context) => LogInViewModel(),
//      child: MaterialApp(
//        debugShowCheckedModeBanner: false,
//        title: 'Flutter Demo',
//        theme: ThemeData(
//          primarySwatch: Colors.blue,
//        ),
//        home: LogInPage(),
//      ),
      return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => LogInViewModel(),
            child: LogInPage(),
          ),
          ChangeNotifierProvider(
            create: (context) => HomeViewModel(),
            child: HomePage(),
          )
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: LogInPage(),
        ),
    );
  }
}
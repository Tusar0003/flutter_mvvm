import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttermvvm/viewModel/home_view_model.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
//    final homeViewModel = Provider.of<HomeViewModel>(context);
//    homeViewModel.getStudentReport();
  }

  @override
  Widget build(BuildContext context) {
    final homeViewModel = Provider.of<HomeViewModel>(context);
    homeViewModel.getStudentReport();

    // TODO: implement build
    return WillPopScope(
      onWillPop: () {
//        Navigator.pop(context, true);
        SystemNavigator.pop();
        return Future.value(false);
      },
      child: Scaffold(
          appBar: AppBar(
            title: Text(
                'Home'
            ),
            automaticallyImplyLeading: false,   // Hiding the back button
          ),
          body: Container(

          )
      ),
    );
  }
}
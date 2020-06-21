import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttermvvm/viewModel/home_view_model.dart';
import 'package:fluttermvvm/widgets/student_report_list.dart';
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
    Provider.of<HomeViewModel>(context, listen: false).getStudentReport();
  }

  @override
  Widget build(BuildContext context) {
    final homeViewModel = Provider.of<HomeViewModel>(context);

    bool _progressBarActive = true;

    if (!homeViewModel.isLoading) {
      setState(() {
        _progressBarActive = false;
      });
    }

    // TODO: implement build
    return WillPopScope(
      onWillPop: () {
//        Navigator.pop(context, true);
        SystemNavigator.pop();
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Home'),
          automaticallyImplyLeading: false, // Hiding the back button
        ),
//        body: StudentReportList(studentReportList: homeViewModel.studentReportList)),
        body: Container(
          child: Center(
            child: _progressBarActive == true?const CircularProgressIndicator(): Container(
              child: StudentReportList(studentReportList: homeViewModel.studentReportList),
            )
          ),
        )
      )
    );
  }

  showCustomProgressDialog() {
    showGeneralDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.3), // background color
      barrierDismissible: false, // should dialog be dismissed when tapped outside
      barrierLabel: "Dialog", // label for barrier
      transitionDuration: Duration(milliseconds: 400), // how long it takes to popup dialog after button click
      pageBuilder: (_, __, ___) { // your widget implementation
        return SizedBox.expand( // makes widget fullscreen
          child: Center(
            child: SizedBox(
              height: 50,
              width: 50,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.blue),
                strokeWidth: 5,
              ),
            ),
          ),
        );
      },
    );
  }
}

import 'dart:convert';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:property_change_notifier/property_change_notifier.dart';
import 'package:provider/provider.dart';
import 'package:fluttermvvm/viewModel/log_in_view_model.dart';

import 'home_page.dart';

class LogInPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LogInPageState();
  }
}

class _LogInPageState extends State<LogInPage> {

  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isProgressDialogShown = false;
  bool _goToHome = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void showToast(bool isErrorMessage, String message) {
    if (isErrorMessage) {
      Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    } else {
      Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        backgroundColor: Colors.green,
        textColor: Colors.white,
      );
    }
  }

  showProgressDialog() {
    AlertDialog alert = AlertDialog(
      content: new Row(
        children: [
          CircularProgressIndicator(),
          Container(
            margin: EdgeInsets.only(left: 20.0),
            child:Text("Loading..." ),
          ),
        ],
      ),
    );

    showDialog(barrierDismissible: false,
      context:context,
      builder:(BuildContext context) {
        return alert;
      },
    );
  }

  showCustomProgressDialog() {
    _isProgressDialogShown = true;

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

  void hideProgressBar() {
    if (_isProgressDialogShown) {
      _isProgressDialogShown = false;

//        Navigator.pop(context, false);
//        Navigator.of(context, rootNavigator: true).pop('dialog');
//        Navigator.of(context, rootNavigator: true).pop();
//        Navigator.of(context).pop();
      Navigator.pop(context);
    }
  }

  showCustomDialog() {
    showGeneralDialog(
      context: context,
      barrierColor: Colors.black12.withOpacity(0.6), // background color
      barrierDismissible: false, // should dialog be dismissed when tapped outside
      barrierLabel: "Dialog", // label for barrier
      transitionDuration: Duration(milliseconds: 400), // how long it takes to popup dialog after button click
      pageBuilder: (_, __, ___) { // your widget implementation
        return SizedBox.expand( // makes widget fullscreen
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 5,
                child: SizedBox.expand(child: FlutterLogo()),
              ),
              Expanded(
                flex: 1,
                child: SizedBox.expand(
                  child: RaisedButton(
                    color: Colors.blue[900],
                    child: Text(
                      "Dismiss",
                      style: TextStyle(fontSize: 40),
                    ),
                    textColor: Colors.white,
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    final logInViewModel = Provider.of<LogInViewModel>(context);
//    final logInViewModel = PropertyChangeProvider.of<LogInViewModel>(context);
//    final logInViewModel = LogInViewModel();
//    logInViewModel.addListener(() =>
//        Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()))
//    );

    final ProgressDialog progressDialog = ProgressDialog(context);
    var isLoggedIn = Provider.of<LogInViewModel>(context).isLoggedIn;
    var error = Provider.of<LogInViewModel>(context).error;

    if (isLoggedIn) {
      print('if');
//      progressDialog.hide();
      Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
    } else {
      setState(() {
        _goToHome = true;
      });
      print('else');
//      progressDialog.hide();
//      hideProgressBar();
    }

    if (error != null) {
      showToast(true, error);
    }

    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/blue_gradient.jpg'),
              fit: BoxFit.fill,
            ),
//            shape: BoxShape.circle,
          ),
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'Log In',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 50.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w600
                  )
                ),
//                style: TextStyle(
//                  fontSize: 50.0,
//                  color: Colors.black,
//                  fontWeight: FontWeight.bold
//                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    width: 1,
                    color: Colors.black
                  ),
                  borderRadius: BorderRadius.circular(5.0)
                ),
                child: TextField(
                  controller: _userNameController,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
//                    contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 8.0),
                    hintText: 'User name',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    border: InputBorder.none
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10.0, bottom: 20.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                      width: 1,
                      color: Colors.black
                  ),
                  borderRadius: BorderRadius.circular(5.0)
                ),
                child: TextField(
                  controller: _passwordController,
                  obscureText: true,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
//                    contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 8.0),
                    hintText: 'Password',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    border: InputBorder.none
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 40.0,
                child: RaisedButton(
                  onPressed: () {
                    if (_userNameController.value.text.isEmpty) {
                      showToast(true, 'User name is empty!');
                    } else if (_passwordController.value.text.isEmpty) {
                      showToast(true, 'Password is empty!');
                    } else {
//                      showAlertDialog('title', 'message');
//                      showCustomProgressDialog();
//                      showProgressDialog(context);
                      logInViewModel.logIn(_userNameController.text, _passwordController.text);
                      progressDialog.show();
                      if (_goToHome) {
                        progressDialog.hide().then((onValue) {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                        });
                      }
                    }
                  },
                  color: Colors.blue,
                  child: Text(
                    'Log In',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.white
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  showAlertDialog(String title, String message) {
    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text("Cancel"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    Widget continueButton = FlatButton(
      child: Text("Ok"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alertDialog = AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alertDialog;
      },
    );
  }
}
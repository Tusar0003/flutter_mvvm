import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttermvvm/model/home_menu.dart';
import 'package:fluttermvvm/view/log_in_page.dart';
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

  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (_selectedIndex) {
      case 1:
        Navigator.pushNamed(context, '/Demo');
        break;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<HomeViewModel>(context, listen: false).getStudentReport();
  }

  showAlertDialog(String title, String message) {
    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text("No"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    Widget continueButton = FlatButton(
      child: Text("Yes"),
      onPressed: () {
//          Navigator.pop(context);
//          Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
//          _logOut(true);
        Navigator.pushNamed(context, '/');
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

  @override
  Widget build(BuildContext context) {
    final homeViewModel = Provider.of<HomeViewModel>(context);

    const List<Choice> menus = const <Choice>[
      const Choice(title: 'Car', icon: Icons.directions_car),
      const Choice(title: 'Bicycle', icon: Icons.directions_bike),
      const Choice(title: 'Boat', icon: Icons.directions_boat),
      const Choice(title: 'Bus', icon: Icons.directions_bus),
      const Choice(title: 'Train', icon: Icons.directions_railway),
      const Choice(title: 'Walk', icon: Icons.directions_walk),
      const Choice(title: 'Log out', icon: Icons.exit_to_app)
    ];

    bool _progressBarActive = true;
    Choice _selectedMenu = menus[0];

    if (!homeViewModel.isLoading) {
      setState(() {
        _progressBarActive = false;
      });
    }

    void _select(Choice choice) {
      // Causes the app to rebuild with the new _selectedMenu.
      setState(() {
        _selectedMenu = choice;
      });

      switch (choice.title.toLowerCase()) {
        case 'car':
          print(choice.title);
          Navigator.pushNamed(context, '/Demo');
          break;
        case 'bicycle':
          print(choice.title);
          break;
        case 'boat':
          print(choice.title);
          break;
        case 'bus':
          print(choice.title);
          break;
        case 'train':
          print(choice.title);
          break;
        case 'walk':
          print(choice.title);
          break;
        case 'log out':
          print(choice.title);
          showAlertDialog('Log Out', 'Do you want to log out?');
          break;
      }
    }

    // TODO: implement build
    return WillPopScope(
      onWillPop: () {
//        Navigator.pop(context, true);
//        SystemNavigator.pop();
        showAlertDialog('Log Out', 'Do you want to log out?');
        return Future.value(true);
      },
//      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Home'),
//          automaticallyImplyLeading: false, // Hiding back button
          actions: <Widget>[
            // action button
            IconButton(
              icon: Icon(menus[0].icon),
              onPressed: () {
                _select(menus[0]);
              },
            ),
            // action button
            IconButton(
              icon: Icon(menus[1].icon),
              onPressed: () {
                _select(menus[1]);
              },
            ),
            // overflow menu
            PopupMenuButton(
              onSelected: _select,
              itemBuilder: (BuildContext context) {
                return menus.skip(2).map((Choice choice) {
                  return PopupMenuItem<Choice>(
                    value: choice,
                    child: Text(choice.title),
                  );
                }).toList();
              },
            )
          ],// g the back button
        ),
//        body: StudentReportList(studentReportList: homeViewModel.studentReportList)),
        body: Container(
          child: Center(
            child: _progressBarActive == true?const CircularProgressIndicator(): Container(
              child: StudentReportList(studentReportList: homeViewModel.studentReportList),
            )
          ),
        ),
        drawer: Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text('Drawer Header'),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
              ListTile(
                title: Text('Item 1'),
                onTap: () {
                  Navigator.pushNamed(context, '/Demo');
                },
              ),
              ListTile(
                title: Text('Item 2'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              title: Text('Business'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              title: Text('School'),
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.blue,
          onTap: _onItemTapped,
        ),
      )
    );
  }
}

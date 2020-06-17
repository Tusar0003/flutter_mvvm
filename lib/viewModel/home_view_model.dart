import 'package:flutter/cupertino.dart';
import 'package:fluttermvvm/repository/home_repository.dart';

class HomeViewModel extends ChangeNotifier {

  void getStudentReport() async {
    HomeRepository().getStudentReportList();
  }
}
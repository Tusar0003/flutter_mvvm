import 'package:flutter/cupertino.dart';
import 'package:fluttermvvm/model/student_report.dart';
import 'package:fluttermvvm/model/student_report_response.dart';
import 'package:fluttermvvm/repository/home_repository.dart';

class HomeViewModel extends ChangeNotifier {

  List<StudentReport> studentReportList = List<StudentReport>();
  bool isLoading = true;

  void getStudentReport() async {
    studentReportList = await HomeRepository().getStudentReportList(155391);
    print('ViewModel: ' + studentReportList[0].studentName.toString());
    isLoading = false;
    notifyListeners();
  }
}
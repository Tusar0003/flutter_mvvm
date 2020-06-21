import 'dart:convert';

import 'package:fluttermvvm/model/student_report.dart';
import 'package:fluttermvvm/model/student_report_response.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class HomeRepository {

  final String _baseUrl = 'https://api.edumanbd.com/';

  Future<List<StudentReport>> getStudentReportList(int classConfigId) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    final response = await http.get(_baseUrl + 'student/list/by/class-config-id?'
        + 'access_token=' + preferences.getString('token')
        + '&classConfigId=' + classConfigId.toString()
    );
    print('Repository: ' + response.body.toString());

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
//      print(body);
      final Iterable studentReportList = body['item'];
//      return body.map((studentReport) => StudentReportResponse.fromJson(studentReport));
      return studentReportList.map((studentReport) => StudentReport.fromJson(studentReport)).toList();
    } else {
      throw Exception('Couldn\'t get Student Report!');
    }
  }
}
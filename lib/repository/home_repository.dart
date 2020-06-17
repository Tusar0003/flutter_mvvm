import 'dart:convert';

import 'package:fluttermvvm/model/student_report.dart';
import 'package:http/http.dart' as http;

class HomeRepository {

  final String _baseUrl = 'https://api.edumanbd.com/';

  Future<void> getStudentReportList() async {
    final response = await http.get(_baseUrl + 'student/list/by/class-config-id?access_token=f6a3a043-a0e4-4928-bd46-457131696698&classConfigId=155391');
    print(response.body.toString());

    if (response.statusCode == 200) {
      print(response.body.toString());
      final jsonResponse = json.decode(response.body);
      print(jsonResponse);
//      return body.map((studentReport) => StudentReportResponse.fromJson(studentReport))
    }
  }
}
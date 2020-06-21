import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttermvvm/model/student_report.dart';

class StudentReportList extends StatelessWidget {
  final List<StudentReport> studentReportList;

  StudentReportList({this.studentReportList});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
      itemCount: studentReportList.length,
      itemBuilder: (context, index) {
        final StudentReport studentReport = studentReportList[index];
        return Container(
          padding: EdgeInsets.all(10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(right: 10),
                child: Image(
                  width: 60,
                  height: 60,
                  image: AssetImage('assets/images/placeholder.png'),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    studentReport.studentName,
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    studentReport.studentId,
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                ],
              ),
            ],
          )
        );
      },
    );
  }
}

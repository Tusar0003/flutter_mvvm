import 'package:json_annotation/json_annotation.dart';

class StudentReportResponse {

  String message;
  int msgType;
  List<Item> item;

  StudentReportResponse({this.message, this.msgType, this.item});

  StudentReportResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    msgType = json['msgType'];
    if (json['item'] != null) {
      item = new List<Item>();
      json['item'].forEach((v) {
        item.add(new Item.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['msgType'] = this.msgType;
    if (this.item != null) {
      data['item'] = this.item.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Item {
  String studentId;
  String customStudentId;
  String studentName;
  String studentGender;
  Null studentDOB;
  String studentReligion;
  String motherName;
  String guardianMobile;
  String registrationDate;
  String instituteId;
  Null academicSession;
  Null bloodGroup;
  String fatherName;
  int identificationId;
  String classConfigId;
  String classConfigName;
  int classId;
  String className;
  int shiftId;
  String shiftName;
  int sectionId;
  String sectionName;
  int groupId;
  String groupName;
  int studentCategoryId;
  String studentCategoryName;
  int studentRoll;
  bool studentStatus;
  bool migrationStatus;
  String academicYear;
  Null registrationNo;
  bool check;
  Null deviceId;
  Null stringDateOfBirth;
  Null age;
  Null email;
  Null imageName;
  String mobileNo;
  Null fatherNid;
  Null motherNid;
  Null studentEmail;
  Null height;
  Null weight;
  Null specialDisease;
  Null admissionCategory;
  Null birthCertificateNo;
  Null testimonialNo;
  Null image;
  Null pureByteImage;
  Null studentMobile;
  Null fullImagePath;

  Item(
      {this.studentId,
        this.customStudentId,
        this.studentName,
        this.studentGender,
        this.studentDOB,
        this.studentReligion,
        this.motherName,
        this.guardianMobile,
        this.registrationDate,
        this.instituteId,
        this.academicSession,
        this.bloodGroup,
        this.fatherName,
        this.identificationId,
        this.classConfigId,
        this.classConfigName,
        this.classId,
        this.className,
        this.shiftId,
        this.shiftName,
        this.sectionId,
        this.sectionName,
        this.groupId,
        this.groupName,
        this.studentCategoryId,
        this.studentCategoryName,
        this.studentRoll,
        this.studentStatus,
        this.migrationStatus,
        this.academicYear,
        this.registrationNo,
        this.check,
        this.deviceId,
        this.stringDateOfBirth,
        this.age,
        this.email,
        this.imageName,
        this.mobileNo,
        this.fatherNid,
        this.motherNid,
        this.studentEmail,
        this.height,
        this.weight,
        this.specialDisease,
        this.admissionCategory,
        this.birthCertificateNo,
        this.testimonialNo,
        this.image,
        this.pureByteImage,
        this.studentMobile,
        this.fullImagePath});

  Item.fromJson(Map<String, dynamic> json) {
    studentId = json['studentId'];
    customStudentId = json['customStudentId'];
    studentName = json['studentName'];
    studentGender = json['studentGender'];
    studentDOB = json['studentDOB'];
    studentReligion = json['studentReligion'];
    motherName = json['motherName'];
    guardianMobile = json['guardianMobile'];
    registrationDate = json['registrationDate'];
    instituteId = json['instituteId'];
    academicSession = json['academicSession'];
    bloodGroup = json['bloodGroup'];
    fatherName = json['fatherName'];
    identificationId = json['identificationId'];
    classConfigId = json['classConfigId'];
    classConfigName = json['classConfigName'];
    classId = json['classId'];
    className = json['className'];
    shiftId = json['shiftId'];
    shiftName = json['shiftName'];
    sectionId = json['sectionId'];
    sectionName = json['sectionName'];
    groupId = json['groupId'];
    groupName = json['groupName'];
    studentCategoryId = json['studentCategoryId'];
    studentCategoryName = json['studentCategoryName'];
    studentRoll = json['studentRoll'];
    studentStatus = json['studentStatus'];
    migrationStatus = json['migrationStatus'];
    academicYear = json['academicYear'];
    registrationNo = json['registrationNo'];
    check = json['check'];
    deviceId = json['deviceId'];
    stringDateOfBirth = json['stringDateOfBirth'];
    age = json['age'];
    email = json['email'];
    imageName = json['imageName'];
    mobileNo = json['mobileNo'];
    fatherNid = json['fatherNid'];
    motherNid = json['motherNid'];
    studentEmail = json['studentEmail'];
    height = json['height'];
    weight = json['weight'];
    specialDisease = json['specialDisease'];
    admissionCategory = json['admissionCategory'];
    birthCertificateNo = json['birthCertificateNo'];
    testimonialNo = json['testimonialNo'];
    image = json['image'];
    pureByteImage = json['pureByteImage'];
    studentMobile = json['studentMobile'];
    fullImagePath = json['fullImagePath'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['studentId'] = this.studentId;
    data['customStudentId'] = this.customStudentId;
    data['studentName'] = this.studentName;
    data['studentGender'] = this.studentGender;
    data['studentDOB'] = this.studentDOB;
    data['studentReligion'] = this.studentReligion;
    data['motherName'] = this.motherName;
    data['guardianMobile'] = this.guardianMobile;
    data['registrationDate'] = this.registrationDate;
    data['instituteId'] = this.instituteId;
    data['academicSession'] = this.academicSession;
    data['bloodGroup'] = this.bloodGroup;
    data['fatherName'] = this.fatherName;
    data['identificationId'] = this.identificationId;
    data['classConfigId'] = this.classConfigId;
    data['classConfigName'] = this.classConfigName;
    data['classId'] = this.classId;
    data['className'] = this.className;
    data['shiftId'] = this.shiftId;
    data['shiftName'] = this.shiftName;
    data['sectionId'] = this.sectionId;
    data['sectionName'] = this.sectionName;
    data['groupId'] = this.groupId;
    data['groupName'] = this.groupName;
    data['studentCategoryId'] = this.studentCategoryId;
    data['studentCategoryName'] = this.studentCategoryName;
    data['studentRoll'] = this.studentRoll;
    data['studentStatus'] = this.studentStatus;
    data['migrationStatus'] = this.migrationStatus;
    data['academicYear'] = this.academicYear;
    data['registrationNo'] = this.registrationNo;
    data['check'] = this.check;
    data['deviceId'] = this.deviceId;
    data['stringDateOfBirth'] = this.stringDateOfBirth;
    data['age'] = this.age;
    data['email'] = this.email;
    data['imageName'] = this.imageName;
    data['mobileNo'] = this.mobileNo;
    data['fatherNid'] = this.fatherNid;
    data['motherNid'] = this.motherNid;
    data['studentEmail'] = this.studentEmail;
    data['height'] = this.height;
    data['weight'] = this.weight;
    data['specialDisease'] = this.specialDisease;
    data['admissionCategory'] = this.admissionCategory;
    data['birthCertificateNo'] = this.birthCertificateNo;
    data['testimonialNo'] = this.testimonialNo;
    data['image'] = this.image;
    data['pureByteImage'] = this.pureByteImage;
    data['studentMobile'] = this.studentMobile;
    data['fullImagePath'] = this.fullImagePath;
    return data;
  }
}
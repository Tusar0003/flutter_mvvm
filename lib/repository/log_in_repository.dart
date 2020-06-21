import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LogInRepository {

  final String _baseUrl = 'https://api.edumanbd.com/';

  Future<bool> logIn(String userName, String password) async {

    final clientKey = 'Basic ZWR1bWFuLXdlYi1yZWFkLXdyaXRlLWNsaWVudDpzcHJpbmctc2VjdXJpdHktb2F1dGgyLXJlYWQtd3JpdGUtY2xpZW50LXBhc3N3b3JkMTIzNA==';

    Map<String, String> params = {
      'client_id': 'eduman-web-read-write-client',
      'grant_type': 'password',
      'username': userName,
      'password': password
    };

    try {
      final response = await http.post(
          _baseUrl + 'oauth/token',
          headers: <String, String> {
            'Authorization': clientKey,
            'Content-Type': 'application/x-www-form-urlencoded'
          },
          body: params
      );

      print(response.statusCode.toString());
      if (response.statusCode == 200) {
        print(response.body.toString());

        Map<String, dynamic> jsonResponse = json.decode(response.body);
        var token = jsonResponse['access_token'];
        print(token);

        SharedPreferences preferences = await SharedPreferences.getInstance();
        await preferences.setString('token', token);

        return true;
      } else {
        print(response.body.toString());
        return false;
      }
    } catch(exception) {
      print(exception.toString());
      return false;
    }

//    switch (response.statusCode) {
//      case 200:
//        var responseJson = json.decode(response.body.toString());
//        print(responseJson);
//        return responseJson;
//      case 400:
//        throw BadRequestException(response.body.toString());
//      case 401:
//      case 403:
//        throw UnauthorisedException(response.body.toString());
//      case 500:
//      default:
//        throw FetchDataException(
//            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
//    }
  }
}
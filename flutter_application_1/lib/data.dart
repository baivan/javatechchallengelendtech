import 'dart:convert';
import 'dart:core';

import 'package:http/http.dart' as http;

import 'exceptions.dart';

Future<Map<String, dynamic>> homePageData() async {
  var header = {
    'Authorization':
        'Bearer eyJhbGciOiJIUzI1NiJ9.eyJuYW1lIjoiSmFtZXMgTmp1Z3VuYSIsImVtYWlsIjoiamFtZXNuanVndW5hMEBnbWFpbC5jb20iLCJzdWIiOiJqYW1lcyIsImp0aSI6IjVhZjM1OWY4LWJjNDAtNDEzOS04YWFiLWZiODIzZThiMjkyOSIsImlhdCI6MTY1NzY4MTgwOCwiZXhwIjoxNjU4MTEzODA4fQ.oqf95DjHU4e6tiGvK62A7DsVm3xBLyQZmR59_YYtsqM',
    'Accept': 'application/json',
    'profile_id': '1',
    "Content-Type": "application/json"
  };

  var url = Uri.parse("http://localhost:4567/balance");
  var response = await http.post(url, headers: header, body: "");

  var decoded = jsonDecode(response.body);

  if (response.statusCode < 200 || response.statusCode > 299) {
    if (decoded['result_code'] == 1) {
      throw TokenExpiredException(reason: decoded['message']);
    }
    throw UnableToProcess(reason: decoded.toString());
  }
  return decoded as Map<String, dynamic>;
}

Future<List<Map<String, dynamic>>> transactionsList(
    String start, String end) async {
  var header = {
    'Authorization':
        'Bearer eyJhbGciOiJIUzI1NiJ9.eyJuYW1lIjoiSmFtZXMgTmp1Z3VuYSIsImVtYWlsIjoiamFtZXNuanVndW5hMEBnbWFpbC5jb20iLCJzdWIiOiJqYW1lcyIsImp0aSI6IjVhZjM1OWY4LWJjNDAtNDEzOS04YWFiLWZiODIzZThiMjkyOSIsImlhdCI6MTY1NzY4MTgwOCwiZXhwIjoxNjU4MTEzODA4fQ.oqf95DjHU4e6tiGvK62A7DsVm3xBLyQZmR59_YYtsqM',
    'Accept': 'application/json',
    'profile_id': '1',
    "Content-Type": "application/json"
  };

  var url = Uri.parse("http://localhost:4567/transactions/$start/$end");
  var response = await http.post(url, headers: header, body: "");

  var decoded = jsonDecode(response.body);

  if (response.statusCode < 200 || response.statusCode > 299) {
    if (decoded['result_code'] == 1) {
      throw TokenExpiredException(reason: decoded['message']);
    }
    throw UnableToProcess(reason: decoded.toString());
  }
  List<Map<String, dynamic>> transactions = decoded;

  return transactions;
}

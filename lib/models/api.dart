import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CallApi {
  //API URL
  final String _url = 'http://zielu922.vot.pl/api/auth/';
  final String _api = 'http://zielu922.vot.pl/api/';

  postData(data, apiUrl) async {
    var fullUrl = _url + apiUrl;
    return await http.post(fullUrl,
        body: jsonEncode(data), headers: _setHeaders());
  }

  getData(apiUrl) async {
    var fullUrl = _url + apiUrl;
    return await http.get(fullUrl, headers: _setHeaders());
  }

  postDataWithToken(data, apiUrl) async {
    var fullUrl = _url + apiUrl;
    var headers = {
      'Authorization': 'Bearer ' + await _getToken(),
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    return await http.post(fullUrl, body: jsonEncode(data), headers: headers);
  }

  getDataWithoutToken(apiUrl) async {
    // var fullUrl = _url + apiUrl;
    var fullUrl = _api + apiUrl;
    var headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    return await http.get(fullUrl, headers: headers);
  }

  getDataWithToken(apiUrl) async {
    var fullUrl = _url + apiUrl;
    var headers = {
      'Authorization': 'Bearer ' + await _getToken(),
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    return await http.get(fullUrl, headers: headers);
  }

  _setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      };

  _getToken() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    return localStorage.getString('token');
  }

  getUserInfo(id) async {
    // Take user info from the server ...
    var data = {
      'id': id,
    };
    var res = await CallApi().postDataWithToken(data, 'userInfo');
    var body = json.decode(res.body);
    print("Ok, getting user info");
    return await body;
  }
}

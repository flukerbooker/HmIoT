import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isLoading = false;

  final _form = GlobalKey<FormState>();
  FocusNode passwordFocusNode;

  Map<String, String> _authData = {
    'email': '',
    'password': '',
  };

  @override
  void initState() {
    super.initState();
    passwordFocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    passwordFocusNode.dispose();
  }

  void _showMsg(msg) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              "Something went wrong",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            content: Text(
              msg,
              style: TextStyle(color: Colors.black54),
            ),
            actions: [
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16)))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            ///////////  background///////////
            new Container(
              decoration: new BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.3, 0.6],
                  colors: [
                    Color(0xFF8dc63f),
                    Color(0xFF1fade5),
                  ],
                ),
              ),
            ),
            Positioned(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 40.0,
                    ),
                    Card(
                      elevation: 4.0,
                      color: Colors.white,
                      margin: EdgeInsets.only(left: 20, right: 20),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Form(
                          key: _form,
                          child: Column(
                            children: <Widget>[
                              /////////////  Email//////////////
                              TextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                style: TextStyle(color: Color(0xFF000000)),
                                cursorColor: Color(0xFF9b9b9b),
                                keyboardType: TextInputType.text,
                                onFieldSubmitted: (_) {
                                  FocusScope.of(context)
                                      .requestFocus(passwordFocusNode);
                                },
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.account_circle,
                                    color: Colors.grey,
                                  ),
                                  hintText: "Email",
                                  hintStyle: TextStyle(
                                      color: Color(0xFF9b9b9b),
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal),
                                ),
                                validator: (value) {
                                  String pattern =
                                      r'(^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$)';
                                  RegExp regExp = RegExp(pattern);
                                  if (value.isEmpty) {
                                    return 'Email is Required';
                                  } else if (!regExp.hasMatch(value)) {
                                    return "Invalid Email";
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  _authData["email"] = value;
                                },
                              ),

                              /////////////// password////////////////////
                              TextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                style: TextStyle(color: Color(0xFF000000)),
                                cursorColor: Color(0xFF9b9b9b),
                                keyboardType: TextInputType.text,
                                focusNode: passwordFocusNode,
                                obscureText: true,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.vpn_key,
                                    color: Colors.grey,
                                  ),
                                  hintText: "Password",
                                  hintStyle: TextStyle(
                                      color: Color(0xFF9b9b9b),
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal),
                                ),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Password is required';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  _authData["password"] = value;
                                },
                              ),
                              /////////////  LogIn Botton///////////////////
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: FlatButton(
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            top: 8,
                                            bottom: 8,
                                            left: 10,
                                            right: 10),
                                        child: Text(
                                          _isLoading ? 'Loading...' : 'Login',
                                          textDirection: TextDirection.ltr,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15.0,
                                            decoration: TextDecoration.none,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      ),
                                      color: Color(0xFF8dc63f),
                                      disabledColor: Colors.grey,
                                      shape: new RoundedRectangleBorder(
                                          borderRadius:
                                              new BorderRadius.circular(20.0)),
                                      onPressed: _isLoading ? null : _login,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: FlatButton(
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            top: 8,
                                            bottom: 8,
                                            left: 10,
                                            right: 10),
                                        child: Text(
                                          'Register',
                                          textDirection: TextDirection.ltr,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15.0,
                                            decoration: TextDecoration.none,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      ),
                                      color: Color(0xFF8dc63f),
                                      disabledColor: Colors.grey,
                                      shape: new RoundedRectangleBorder(
                                          borderRadius:
                                              new BorderRadius.circular(20.0)),
                                      onPressed: _signUp,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _signUp() {
    Navigator.pushReplacementNamed(context, "/signup");
  }

  void _login() async {
    if (!_form.currentState.validate()) {
      return;
    }
    _form.currentState.save();

    setState(() {
      _isLoading = true;
    });

    var data = {'email': _authData['email'], 'password': _authData['password']};

    var res = await CallApi().postData(data, 'login');
    var body = json.decode(res.body);
    print(body);
    if (body['success'] != null) {
      if (body['success']) {
        SharedPreferences localStorage = await SharedPreferences.getInstance();
        localStorage.setString('token', body['token']);
        localStorage.setString('user', json.encode(body['user']));
        Navigator.pushReplacementNamed(context, "/dashboard");
      } else {
        _showMsg(body['message']);
      }
    } else {
      _showMsg(body['message']);
    }

    setState(() {
      _isLoading = false;
    });
  }
}

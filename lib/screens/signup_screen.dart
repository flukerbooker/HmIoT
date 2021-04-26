import 'dart:convert';
import 'package:flutter/material.dart';
import '../models/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignupScreen extends StatefulWidget {
  static const routeName = '/signup';
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool _isLoading = false;

  final _form = GlobalKey<FormState>();

  TextEditingController passwordController;

  FocusNode lastnameFocusNode;
  FocusNode emailFocusNode;
  FocusNode passwordFocusNode;
  FocusNode confirmPasswordFocusNode;

  Map<String, String> _registerData = {
    'firstname': '',
    'lastname': '',
    'email': '',
    'password': ''
  };

  @override
  void initState() {
    super.initState();
    passwordController = TextEditingController();
    lastnameFocusNode = FocusNode();
    emailFocusNode = FocusNode();
    passwordFocusNode = FocusNode();
    confirmPasswordFocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    passwordController.dispose();
    lastnameFocusNode.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    confirmPasswordFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            /////////////  background/////////////
            new Container(
              decoration: new BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.0, 0.4, 0.9],
                  colors: [
                    Color(0xFFFF835F),
                    Color(0xFFFC663C),
                    Color(0xFFFF3F1A),
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              /////////////// name////////////
                              TextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                style: TextStyle(color: Color(0xFF000000)),
                                cursorColor: Color(0xFF9b9b9b),
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.account_circle,
                                    color: Colors.grey,
                                  ),
                                  hintText: "Firstname",
                                  hintStyle: TextStyle(
                                      color: Color(0xFF9b9b9b),
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal),
                                ),
                                onFieldSubmitted: (_) {
                                  FocusScope.of(context)
                                      .requestFocus(lastnameFocusNode);
                                },
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Firstname is Required';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  _registerData["firstname"] = value;
                                },
                              ),
                              TextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                style: TextStyle(color: Color(0xFF000000)),
                                cursorColor: Color(0xFF9b9b9b),
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.account_circle,
                                    color: Colors.grey,
                                  ),
                                  hintText: "Lastname",
                                  hintStyle: TextStyle(
                                      color: Color(0xFF9b9b9b),
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal),
                                ),
                                focusNode: lastnameFocusNode,
                                onFieldSubmitted: (_) {
                                  FocusScope.of(context)
                                      .requestFocus(emailFocusNode);
                                },
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Lastname is Required';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  _registerData["lastname"] = value;
                                },
                              ),

                              /////////////// Email ////////////
                              TextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                style: TextStyle(color: Color(0xFF000000)),
                                cursorColor: Color(0xFF9b9b9b),
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.mail,
                                    color: Colors.grey,
                                  ),
                                  hintText: "Email",
                                  hintStyle: TextStyle(
                                      color: Color(0xFF9b9b9b),
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal),
                                ),
                                focusNode: emailFocusNode,
                                onFieldSubmitted: (_) {
                                  FocusScope.of(context)
                                      .requestFocus(passwordFocusNode);
                                },
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
                                  _registerData["email"] = value;
                                },
                              ),

                              /////////////// password ////////////
                              TextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                style: TextStyle(color: Color(0xFF000000)),
                                cursorColor: Color(0xFF9b9b9b),
                                keyboardType: TextInputType.text,
                                obscureText: true,
                                controller: passwordController,
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
                                focusNode: passwordFocusNode,
                                onFieldSubmitted: (_) {
                                  FocusScope.of(context)
                                      .requestFocus(confirmPasswordFocusNode);
                                },
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "Password is Required";
                                  } else if (value.length < 8) {
                                    return "Password is too short!";
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  _registerData['password'] = value;
                                },
                              ),

                              TextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                style: TextStyle(color: Color(0xFF000000)),
                                cursorColor: Color(0xFF9b9b9b),
                                keyboardType: TextInputType.text,
                                obscureText: true,
                                focusNode: confirmPasswordFocusNode,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.verified_user,
                                    color: Colors.grey,
                                  ),
                                  hintText: "Confirm Password",
                                  hintStyle: TextStyle(
                                      color: Color(0xFF9b9b9b),
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal),
                                ),
                                validator: (value) {
                                  if (value != passwordController.text) {
                                    return 'Passwords do not match!';
                                  }
                                  return null;
                                },
                              ),

                              /////////////// SignUp Button ////////////
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
                                        _isLoading
                                            ? 'Creating...'
                                            : 'Create account',
                                        textDirection: TextDirection.ltr,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15.0,
                                          decoration: TextDecoration.none,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                    color: Colors.red,
                                    disabledColor: Colors.grey,
                                    shape: new RoundedRectangleBorder(
                                        borderRadius:
                                            new BorderRadius.circular(20.0)),
                                    onPressed:
                                        _isLoading ? null : _handleSignup),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    /////////////// already have an account ////////////
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: InkWell(
                        onTap: () {
                          Navigator.pushReplacementNamed(context, "/login");
                        },
                        child: Text(
                          'Already have an Account',
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.normal,
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

  void _handleSignup() async {
    if (!_form.currentState.validate()) {
      return;
    }
    _form.currentState.save();
    setState(() {
      _isLoading = true;
    });

    var data = {
      'name': _registerData['firstname'] + " " + _registerData['lastname'],
      'email': _registerData['email'],
      'password': _registerData['password'],
      'password_confirmation': _registerData['password'],
    };

    var res = await CallApi().postData(data, 'register');
    var body = json.decode(res.body);
    print(body);
    if (body['success'] != null) {
      if (body['success']) {
        SharedPreferences localStorage = await SharedPreferences.getInstance();
        localStorage.setString('token', body['token']);
        localStorage.setString('user', json.encode(body['user']));

        Navigator.pushReplacementNamed(context, "/login");
      } else {
        print(body['errors']['name'][0]);
      }
    } else {
      print(body['errors']['name'][0]);
    }

    setState(() {
      _isLoading = false;
    });
  }
}

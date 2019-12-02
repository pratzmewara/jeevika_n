import 'package:flutter/material.dart';
import 'package:jeevika_n/Presentation/utils.dart';
import 'dart:async';
import 'dart:convert';

import 'package:jeevika_n/Presentation/utils.dart' ;
import 'package:jeevika_n/Screen/homepage.dart';
import 'package:jeevika_n/Presentation/utils.dart' as prefix0;
import 'package:jeevika_n/modules/global.dart';
import 'package:toast/toast.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';


class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextStyle style = TextStyle(fontSize: 20.0, color: primaryColor,);

  gotoHomepage(){
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomePage(
    )));
  }


  final myController = TextEditingController();
  String _signname;
  String _signusername;
  String _signemail;
  String _signmob;
  String _signpassword;
  String _signcpassword;
  bool _validate = false;



  Icon ic = Icon(Icons.lock_outline, color: Colors.grey,);

  void toHomePage() {
    _key.currentState?.reset();

    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomePage()));

    setState(() {
      _load=false;
    });
  }

//  pass(){
//    if(obsc){
//      setState(() {
//        ic=Icon(Icons.lock_open,color: Colors.pink,);
//        obsc=false;
//      });
//    }
//    else if(!obsc){
//      setState(() {
//        ic=Icon(Icons.lock_outline,color: Colors.grey,);
//        obsc=true;
//      });
//    }
//  }

  GlobalKey<FormState> _key = new GlobalKey();
//  SharedPreferencesTest s=new SharedPreferencesTest();

  Map<String, dynamic> body =


  {
    "email": "aangadsharma1016@gmail.com",
    "password": "L04DB4L4NC3R",
    "phone_number": "9971673330"
  }

  ;

  @override
  void initState() {
//    new FirebaseNotifications().setUpFirebase();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: new Form(
        key: _key,
        autovalidate: _validate,
        child: FormUI(),
      ),);
  }

  bool _load = false;

  Widget FormUI() {
    Widget loadingIndicator2 =_load? Container(
        color: Colors.transparent,
        height: MediaQuery.of(context).size.height,
        width:  MediaQuery.of(context).size.width,
        child:Center( child:Container(
          height: 200,
          width: 250,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),

            gradient:RadialGradient(

              stops: [ 0.1,10],
              colors: [
//
                Colors.grey[200],

                Colors.grey[400],

              ],),
          ),


          child: new Padding(padding: const EdgeInsets.all(16.0),child: new Center(child:Container(

              child: Column(

                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  new CircularProgressIndicator(),
                  Padding(padding: EdgeInsets.all(5),),
                  Text("Signing In...",style: bigPinkText,)
                ],
              )
          ) )),
        ))):new Container();
    return Stack(children: <Widget>[SingleChildScrollView(child: Container(


        decoration: BoxDecoration(
          color: backgroundColor,


        ),

        child: Container(child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 60.0),
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Create an Account',
                      textDirection: TextDirection.ltr,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: prefix0.primaryColor,
                          decoration: TextDecoration.none,
                          fontSize: 21.0,

                          fontWeight: FontWeight.w500
                      ),),

                  ],
                ),
              ),

              Container(
                  padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 30),
                  child: Theme(
                      data: new ThemeData(
                          primaryColor: prefix0.primaryColor,
                          accentColor:prefix0.primaryColor,
                          hintColor:prefix0.primaryColor,
                      ),
                      child:
                      TextFormField(
                        style: TextStyle(color: prefix0.primaryColor,),
                        cursorColor: Theme
                            .of(context)
                            .primaryColor,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintStyle: loginformText,
                          labelStyle: loginformText,
                          hintText: 'What People call you?',
                          labelText: 'Full Name',

                        ),
                        controller: myController,

                        validator: validateName,
                        onSaved: (String val) {
                          _signname = myController.text.toString();
                        },
                      ))
              ),

              Container(
                padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
                child: Theme(
                    data: new ThemeData(
                        primaryColor: prefix0.primaryColor,
                        accentColor:prefix0.primaryColor,
                        hintColor: prefix0.primaryColor,
                    ),
                    child:
                    new TextFormField(
                        style: TextStyle(color: prefix0.primaryColor,),
                        cursorColor: Theme
                            .of(context)
                            .accentColor,
                        decoration: new InputDecoration(
                          hintStyle: loginformText,
                          labelStyle: loginformText,
                          hintText: 'Email ID',
                          labelText: 'Email ID',
                          border: OutlineInputBorder(),),
                        keyboardType: TextInputType.emailAddress,
                        validator: validateEmail,
                        onSaved: (String val) {
                          _signemail = val;
                        })),
              ),
              Container(
                  padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
                  child:
                  Theme(
                      data: new ThemeData(
                          primaryColor: prefix0.primaryColor,
                          accentColor:prefix0.primaryColor,
                          hintColor: prefix0.primaryColor,
                      ),
                      child: TextFormField(
                        style: TextStyle(color: prefix0.primaryColor,),
                        cursorColor: Theme
                            .of(context)
                            .accentColor,
                        decoration: const InputDecoration(
                            hintStyle: loginformText,
                            labelStyle: loginformText,
                            border: OutlineInputBorder(),
                            hintText: 'Where your Friends can call you?',
                            labelText: 'Mobile Number'
                        ),
                        keyboardType: TextInputType.phone,
                        validator: validateMobile,
                        onSaved: (String val) {
                          _signmob = val;
                        },
                      ))),
              Container(
                padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
                child:
                Theme(
                    data: new ThemeData(
                        primaryColor: prefix0.primaryColor,
                        accentColor:prefix0.primaryColor,
                        hintColor: prefix0.primaryColor,
                    ),
                    child:TextFormField(
                      style: TextStyle(color: prefix0.primaryColor,),
                      cursorColor: Theme
                          .of(context)
                          .accentColor,
                      decoration: const InputDecoration(
                          hintStyle: loginformText,
                          labelStyle: loginformText,
                          border: OutlineInputBorder(),
                          hintText: "**********",
                          labelText: 'Password'
                      ),
                      validator: (val) =>
                      val.length == 0
                          ? 'Please Enter the Password'
                          : (val.length < 6) ? 'Password too short' : null,
                      onSaved: (val) => _signpassword = val,
                      obscureText: true,


                    )),),
              Container(
                padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
                child: Theme(
                    data: new ThemeData(
                        primaryColor: prefix0.primaryColor,
                        accentColor:prefix0.primaryColor,
                        hintColor: prefix0.primaryColor,
                    ),
                    child:
                    TextFormField(
                      style: TextStyle(color:prefix0.primaryColor,),
                      cursorColor: Theme
                          .of(context)
                          .accentColor,
                      decoration: const InputDecoration(
                          hintStyle: loginformText,
                          labelStyle: loginformText,
                          border: OutlineInputBorder(),
                          hintText: "**********",
                          labelText: 'Confirm Password'
                      ),
                      validator: (val) =>
                      val.length == 0
                          ? 'Please Enter the Password'
                          : (val.length < 6) ? 'Password too short' : null,
                      onSaved: (val) => _signcpassword = val,
                      obscureText: true,


                    )),),


              new Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  // margin: const EdgeInsets.only( right: 20.0, top: 30.0),
                  alignment: Alignment.center,
                  child: new Row(
                      children: <Widget>[
                        Container(
                            width: MediaQuery
                                .of(context)
                                .size
                                .width - 100,
                            margin: const EdgeInsets.only(
                                left: 50.0, right: 20.0, top: 30.0),
                            alignment: Alignment.center,
                            child:
                            new Row(
                                children: <Widget>[
                                  new Expanded(
                                      child: new FlatButton(
                                        shape: new RoundedRectangleBorder(
                                            borderRadius: new BorderRadius
                                                .circular(3.0)),
                                        color: prefix0.primaryColor,
                                        onPressed: () {
//                                          gotoHomepage();
                                          setState(() {
//                                              _load=true;
                                            _sendToServer();
                                          });
                                        },
                                        child: new Container(
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 20.0,
                                            horizontal: 20.0,
                                          ),
                                          child: new Row(
                                            mainAxisAlignment: MainAxisAlignment
                                                .center,
                                            children: <Widget>[
                                              new Expanded(
                                                child: Text(
                                                  "SIGN UP",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight: FontWeight
                                                          .bold),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),))
                                ]))
                      ])),
              Container(
                  alignment: Alignment(0, 0),
                  padding: EdgeInsets.only(top: 16, bottom: 2),
                  child: Text("By creating an account you agree to our",
                    style: TextStyle(color: prefix0.primaryColor,
                        fontSize: 12,
                        fontFamily: 'HelveticeNeue'),)
              ),
              Container(
                  alignment: Alignment(0, 0),
                  padding: EdgeInsets.only(top: 2, bottom: 16),
                  child: Text("Terms of Service and Privacy Policy",
                    style: TextStyle(color: prefix0.primaryColor,
                        fontSize: 12,
                        fontFamily: 'HelveticeNeue'),)
              ),


            ])
        ))),
      new Align(child: loadingIndicator2, alignment: FractionalOffset.center,),
    ]);
  }

  String validateName(String value) {
    String patttern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Name is Required";
    } else if (!regExp.hasMatch(value)) {
      return "Name must be a-z and A-Z";
    }
    return null;
  }

  String validateMobile(String value) {
    String patttern = r'(^[0-9]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Mobile is Required";
    } else if(value.length != 10){
      return "Mobile number must 10 digits";
    }else if (!regExp.hasMatch(value)) {
      return "Mobile Number must be digits";
    }
    return null;
  }

  String validateEmail(String value) {
    String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "Email is Required";
    } else if(!regExp.hasMatch(value)){
      return "Invalid Email";
    }else {
      return null;
    }
  }

  String validateCpassword(String value) {
    if (value.length == 0) {
      return "Re-Type the password";
    } else if(value.compareTo(_signpassword)!=0){
      return "Password did not match";
    }else {
      return null;
    }
  }

  _sendToServer() {
    if(_key.currentState.validate())
    {
      _load=true;
      _key.currentState.save();
      body["email"]=_signemail;
      body["password"]=_signpassword;
      body["phone_number"]=_signmob;



      Future fetchPosts(http.Client client) async {
        print("yjhtgfdsyutrgds");
        var response = await http.post(
          SIGNUP_URL, headers: {"Content-Type": "application/json"},
          body: json.encode(body),);

        print(response.statusCode);
        if (response.statusCode == 200) {
          final data = json.decode(response.body);
         gotoHomepage();
        }
        Toast.show("Toast plugin app", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
          setState(() {
            _load=false;
          });
        }



      print(body);

      return FutureBuilder(
          future: fetchPosts(http.Client()),
          builder: (BuildContext context,AsyncSnapshot snapshot){
            if(snapshot.data==null){
              return Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );

            }
            else{
             return Container();
            }
          });



//
    }
//


    else{

      setState(() {
        _validate = true;
      });

    }




  }




}
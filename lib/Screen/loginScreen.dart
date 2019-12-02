import 'package:flutter/material.dart';
import 'package:jeevika_n/Presentation/utils.dart';
import 'package:jeevika_n/Presentation/utils.dart' as prefix0;
import 'package:jeevika_n/Screen/signupScreen.dart';
import 'package:jeevika_n/Screen/homepage.dart';
import 'package:jeevika_n/UserManagment/userDataStored.dart';
import 'package:jeevika_n/modules/global.dart';
import 'package:toast/toast.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class LoginScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return LoginScreenState();
  }


}

class LoginScreenState extends State<LoginScreen>{

  gotoHomePage(){
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomePage()));
  }


  GlobalKey<FormState> _key = new GlobalKey();
SharedPreferencesTest s=new SharedPreferencesTest();

  Map<String, dynamic> body =
  {
    "email":"pratz@gmail.com",
    "password":"qwerty",
//    'deviceID':"dukbwifc"
  };

  bool _load=false;
  bool _validate = false;
  String logemail;
  String _logpass;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: new Form(
        key: _key,
        autovalidate: _validate,
        child: FormUI(),
      ), );


  }
  Widget FormUI() {

    Widget loadingIndicator =_load? Container(
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
                  Text("Checking In...",style: bigPinkText,)
                ],
              )
          ) )),
        ))):new Container();


    int flag;
    return   Stack(children: <Widget>[SingleChildScrollView(child:

    Container(

        height: MediaQuery.of(context).size.height,

        color: backgroundColor,


        child: new Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround ,
            children: <Widget>[

              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text("Jeevika",style: TextStyle(color: prefix0.primaryColor,fontWeight: FontWeight.w500,fontSize: 34),),
                    Container(
                        padding: EdgeInsets.only(left: 16.0,right:16.0,top: 26.0),
                        child:
                        Theme(
                            data: new ThemeData(
                              primaryColor: prefix0.primaryColor,
                              accentColor:prefix0.primaryColor,
                              hintColor: prefix0.primaryColor,
                            ),
                            child: TextFormField(
                              style: TextStyle(color: prefix0.primaryColor,),
                              cursorColor:  primaryColor,


                              decoration: const InputDecoration(
                                  hintStyle: loginformText,
                                  labelStyle: loginformText,
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: prefix0.primaryColor,
                                    ),
                                  ),


                                  hintText: 'eg@gmail.com',
                                  labelText: 'Email or Phone Number'
                              ),
                              keyboardType: TextInputType.emailAddress,
                                validator: validateEM,
                                onSaved: (String val) {
                                  logemail = val;
                                  print(logemail);
                                }

                            ))
                    ),
                    Container(
                        padding: EdgeInsets.only(left: 16.0,right:16.0,top: 16.0),
                        child:   Theme(
                            data: new ThemeData(
                              primaryColor: prefix0.primaryColor,
                              accentColor:prefix0.primaryColor,
                              hintColor: prefix0.primaryColor,
                            ),
                            child:
                            TextFormField(
                              style: TextStyle(color: prefix0.primaryColor,),
                              cursorColor:  Theme.of(context).accentColor,
                              decoration: const InputDecoration(
                                  hintStyle: loginformText,
                                  labelStyle: loginformText,
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: prefix0.primaryColor,
                                    ),
                                  ),
//                              suffixIcon:IconButton(icon: Icon(Icons.lock_outline,color: Colors.grey,), onPressed:() {})
//                              hintText: 'Club Name',
                                  labelText: 'Password'
                              ),
                              validator: (val) => val.length == 0 ? 'Please Enter the Password' : (val.length<6)?'Password too short':null,
//                              onSaved: (val) => _logpass = val,
                              obscureText: true,

                            ))
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width-100,
                        margin: EdgeInsets.only(top: 16),
                        alignment: Alignment.center,
                        child:
                        new Row(
                            children: <Widget>[
                              new Expanded(
                                  child: new FlatButton(

                                    shape: new RoundedRectangleBorder(

                                        borderRadius: new BorderRadius.circular(3.0)),
                                    color: prefix0.primaryColor,

                                    onPressed: () {
//                                      gotoHomePage();
                                      setState((){
                                          _load=true;
                                        _login_Server();

                                      });
                                    },

                                    child: new Container(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 20.0,
                                        horizontal: 20.0,
                                      ),
                                      child: new Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          new Expanded(
                                            child: Text(
                                              "LOGIN",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.white ,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),))])),
                    Padding(padding: EdgeInsets.all(5),),
//                    GestureDetector(
//                        onTap: (){
//                          Navigator.push(context,MaterialPageRoute(builder: (context)=>ForgotPasswordScreen()));
//                        },
//                        child: Container(
//                          child:Text("Forgot Password?",style: forgotText,) ,
//                        )),
                    Container(
                        width: MediaQuery.of(context).size.width-100,
                        margin: EdgeInsets.only(top: 80),
                        alignment: Alignment.center,
                        child:
                        new Row(
                            children: <Widget>[
                              new Expanded(
                                  child: new FlatButton(
                                    shape: new RoundedRectangleBorder(
                                        borderRadius: new BorderRadius.circular(3.0)),
                                    color: prefix0.primaryColor,
                                    onPressed: () {
                                      setState((){
                                        Navigator.push(
                                            context, MaterialPageRoute(builder: (context) => SignUpScreen(
                                        )
                                        ));

//                                        toSignupPage();

                                      });
                                    },

                                    child: new Container(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 20.0,
                                        horizontal: 20.0,
                                      ),
                                      child: new Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          new Expanded(
                                            child: Text(
                                              "New to Jeevika? Signup",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.white ,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),))]))

                  ],
                ),
              )]))),
//      new Align(child: loadingIndicator,alignment: FractionalOffset.center,),
    ]);
  }
  String token="";
  _login_Server() {
    if(_key.currentState.validate())
    {
      _key.currentState.save();
      _load=true;

      body["email"] = '$logemail';
      body["password"] = '$_logpass';
//      body["deviceID"]='$token';

      Future fetchPosts(http.Client client) async {
        print("yjhtgfdsyutrgds");
        var response = await http.post(
          LOGIN_URL, headers: {"Content-Type": "application/json"},
          body: json.encode(body),);

        print(response.statusCode);
        if (response.statusCode == 200) {
          final data = json.decode(response.body);



              s.setlogincheck(true);

//              _check_Server(profiledata);
             gotoHomePage();

            Toast.show("Toast plugin app", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);

//          }
//          else {
//            Toast.show("Toast plugin app", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
//            setState(() {
//              _load=false;
//            });
//          }
        }
        else {
          Toast.show("Toast plugin app", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
        }
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




    }



    else{

      // validation error
      setState(() {
        _validate = true;
      });

    }




  }
  String validateEM(String value) {
    print (value);
    String patttern = r'(^[0-9]*$)';
    RegExp regExp = new RegExp(patttern);
    String pattern1 = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp1 = new RegExp(pattern1);
//    if(regExp.hasMatch(value) && (value.isNotEmpty)){
//
//      if (value.length == 0) {
//        return "Mobile is Required";
//      } else if(value.length != 10){
//        return "Mobile number must 10 digits";
//      }else if (!regExp.hasMatch(value)) {
//        return "Mobile Number must be digits";
//      }
//      return null;
//    }
//    else if(regExp1.hasMatch(value)&& value.isNotEmpty){

      if (value.length == 0) {
        return "Email is Required";
      } else if(!regExp1.hasMatch(value)){
        return "Invalid Email";
      }else {
        return null;
      }
//    }
//    else {
//      return "Enter the Details";
//    }
  }

}
import 'package:flutter/material.dart';
import 'package:jeevika_n/Presentation/utils.dart' as prefix0;
import 'package:jeevika_n/UserManagment/userDataStored.dart';
import 'package:jeevika_n/Presentation/utils.dart';
class SplashScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return SplashScreenState();
  }

}

class SplashScreenState extends State<SplashScreen>{

  SharedPreferencesTest s=new SharedPreferencesTest();

  @override
  void initState() {
checktext();
go();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
backgroundColor: prefix0.primaryColor,
      body: Container(

        child:Center(child: Text("Jeevika",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 34),)),
      ),
    );
  }
  String setstring="false";
  String lat="hey";
  Future<bool> check;
  bool show=false;
  String checktext() {

    check = s.getlogincheck();
    check.then((resultString) {
      setState(() {
        setstring = resultString.toString();
        print(setstring);
      });
    });
    if (setstring == null) {
      return 'sorry';
    }
    else {
      return setstring;
    }
  }
  void go() {



    Future.delayed(const Duration(seconds: 3), () {


        if (setstring.compareTo(true.toString()) == 0) {
          new Future.delayed(
              const Duration(seconds: 0),

                  () =>
                  Navigator.of(context).pushReplacementNamed('/home')

          );
        }
        else if (setstring.compareTo(false.toString()) == 0) {
          print(setstring);
          new Future.delayed(
              const Duration(seconds: 0),

                  () => Navigator.of(context).pushReplacementNamed('/home')

          );
        }
        else {
          new Future.delayed(
              const Duration(seconds: 0),

                  () => Navigator.of(context).pushReplacementNamed('/home')

          );
        }

       });


  }

}
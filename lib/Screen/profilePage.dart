import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jeevika_n/Presentation/utils.dart';
import 'package:jeevika_n/UserManagment/userDataStored.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key key}) : super(key: key);


  @override
  ProfilePageState createState() => ProfilePageState();
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    @required this.minHeight,
    @required this.maxHeight,
    @required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => math.max(maxHeight, minHeight);

  @override
  Widget build(
      BuildContext context,
      double shrinkOffset,
      bool overlapsContent)
  {
    return new SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
@override
bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
  // TODO: implement shouldRebuild
  return null;
}


class ProfilePageState extends State<ProfilePage> {

  SharedPreferencesTest s=new SharedPreferencesTest();

  SliverPersistentHeader normalHeader(String headerText) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: _SliverAppBarDelegate(
          minHeight: 300.0,
          maxHeight: 300.0,
          child:  Container(
color: backgroundColor,
              child:Column(
                children: <Widget>[
                  /*Container(
                    //   color: Colors.white,
                      child:  Container(
                          height: 85,
                          decoration: BoxDecoration(

//                            borderRadius: BorderRadius.only(bottomRight: Radius.circular(20),bottomLeft:Radius.circular(20) ) ,

                            gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              stops: [ 0.1,0.3,0.7,0.9],
                              colors: [
//
                                Colors.pink[700],
                                Colors.pink[600],

                                Colors.pink,
                                Colors.pink[400],

                              ],),
                          ),
                          child:
                          Container(
                            padding: EdgeInsets.all(5),
                              margin: EdgeInsets.only(top: 40),
                              child:Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(headerText,style:whitePageHeading) ,


                                ],
                              ))

                      )),*/
                  Container(
                    height: 215,
                    child: Container(
                        padding: EdgeInsets.all(8),
                        margin: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Color(0xFF4a6777),
                        borderRadius: BorderRadius.circular(10)
                      ),
                        child:Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                       Container(
                            padding: EdgeInsets.all(3),
                      child:  Container(
                        width: 70.0,
                        height: 70.0,
                        // margin: EdgeInsets.only(top:160,left: (MediaQuery.of(context).size.width/4)-40 ),

                        decoration: new BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.teal
                        ),
                        child:new Container(
                          margin: EdgeInsets.all(2),
                          decoration: new BoxDecoration(
                            shape: BoxShape.circle,

                           /* image: new DecorationImage(
                                fit: BoxFit.fill,
                                image: new NetworkImage(
                                    previousSessionData.userDetails.photoUrl
                                    )
                                    ),*/
                          ),
                        ),

                      ),
                    ),

                                        Container(
                                            padding:EdgeInsets.all(3) ,
                                            child:Row(
                                              mainAxisAlignment: MainAxisAlignment.center,

                                              children: <Widget>[
                                                Icon(Icons.person,color: primaryColor,),
                                                Padding(padding: EdgeInsets.all(3)),
                                                //Text(previousSessionData.userDetails.fullName,style:noramlWhiteHeading,)
                                              ],
                                            )),
                            Container(
                                padding:EdgeInsets.all(3) ,
                                child:Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(Icons.phone_iphone,color: primaryColor,),
                                    Padding(padding: EdgeInsets.all(3)),
                                   // Text(previousSessionData.userDetails.phoneNo,style:TextStyle(fontSize: 12.0,color:Colors.white ,fontWeight: FontWeight.w400,decoration: TextDecoration.none))
                                  ],
                                )),
                                     /* previousSessionData.userDetails.email.length==0?Container():  Container(
                                            padding:EdgeInsets.all(3) ,
                                            child:Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: <Widget>[
                                                Icon(Icons.mail,size: 20,color: primaryColor,),
                                                Padding(padding: EdgeInsets.all(3)),
                                                Text(previousSessionData.userDetails.email,style: smallWhiteText)
                                              ],
                                            )),*/




                          ],
                        )

                    ),
                  ),

                ],
              ))
      ),
    );
  }


  SliverPersistentHeader historyHeader(String headerText) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: _SliverAppBarDelegate(
          minHeight: 25.0,
          maxHeight: 25.0,
          child:  Container(
              color: backgroundColor,
              padding: EdgeInsets.only(left: 16,right: 16),
              child:Column(
                children: <Widget>[
                  Container(
                    //   color: Colors.white,
                      child:  Container(
                          height: 25,
                          decoration: BoxDecoration(

                            borderRadius: BorderRadius.all(Radius.circular(5))  ,
                            color: backgroundColor
                          ),
                          child:
                          Container(
                            // margin: EdgeInsets.only(top: 30),
                              child:Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[

                                 Container(
                                   padding: EdgeInsets.only(left: 10),
                                  child:Row(
                                    children: <Widget>[
                                  Text(headerText,style:mediumBoldBlackText) ,

                                    ],
                                  )),
                                ],
                              ))
                      )),


                ],
              ))
      ),
    );
  }

Future<String> id;
  Future<String> name;
  Future<String> email;
  Future<String> phone;
  Future<String> imageUrl;

  String ID="",Name="",Email="",Phone="",ImageUrl="";


  @override
  void initState() {
    super.initState();
    //getProfileData();
  }

  /*getProfileData(){
    id=s.getid();
    id.then((res){
      setState(() {
        ID=res;
      });
    });
    name=s.getName();
    name.then((res){
      setState(() {
        Name=res;
      });
    });
    phone=s.getphone();
    phone.then((res){
      setState(() {
       Phone=res;
      });
    });

    email=s.getEmail();
    email.then((res){
      setState(() {
        Email=res;
      });
    });
    imageUrl=s.getProfileImage();
    imageUrl.then((res){
      setState(() {
        ImageUrl=res;
      });
    });


  }

  void check()
  {
    s.setlogincheck(false);

  }

  Map<String,dynamic> body={
    "userID":"",

  };


  Future fetchPosts(http.Client client) async {
    body["userID"] = '$ID';
    var response = await http.post(
        URL_FETCH_PS, headers: {"Content-Type": "application/json"},
        body: jsonEncode(body));

    // print(response.body);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      if (data["err"].toString().compareTo("false") == 0) {

        if(this.mounted) {
          setState(() {
             previousSessionData = PreviousSessionData.fromJson(data);
          });
         

          //print("erroororor");
          return "yo";
        }
      }
      else {
if(data['msg']=="No previous sessions found!"){
  if(this.mounted) {
    setState(() {
        previousSessionData = PreviousSessionData.fromJson(data);
    });
  

    //print("erroororor");
    return "yo";
  }
}
else{
  return "Sorry for Inconvinence";
}




      }
    }
    else {
      return "Sorry for Inconvinence";
    }
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child:Container(
                color: backgroundColor,
                child:CustomScrollView(
                  //	controller:_scrollController ,
                    slivers: <Widget>[
                      normalHeader("Profile"),
                      historyHeader("History"),
                    ])))
       /* FutureBuilder(
        future: fetchPosts(http.Client()),
    builder: (BuildContext context, AsyncSnapshot snapshot) {
    if (snapshot.data == null) {
    print(snapshot.data);
    return Container(
    height: MediaQuery.of(context).size.height-200,
    width: MediaQuery.of(context).size.width,
    child: Center(
    child: CircularProgressIndicator(),
    ),
    );
    }

       else if(snapshot.data=="Sorry for Inconvinence"){
            return Center(child: Container(child: Text(snapshot.data)));
          }

    else if (snapshot.data != null) {
      if(snapshot.data=="yo"){
    return Container(
            child:Container(
                color: backgroundColor,
                child:CustomScrollView(
                  //	controller:_scrollController ,
                    slivers: <Widget>[
                      normalHeader("Profile"),

                      historyHeader("Previous Check Ins"),
                     previousSessionData.sessions.length>0? SliverList(

                          delegate: new SliverChildBuilderDelegate(
                                (BuildContext context, int index) {
                              return

                               previousSessionData.sessions[index].details.entire.finalPrices.totalPrice>0?    GestureDetector(

                                     behavior: HitTestBehavior.translucent,
                                      onTap: (){
                                       Navigator.push(context,MaterialPageRoute(builder: (context)=>PreviousSessionDetail(clickedSession: previousSessionData.sessions[index],userID: previousSessionData.userDetails.id,)));

                                      },

                                       child: Container(
                                      height: 100,
                                      child: Container(
                                          padding: EdgeInsets.all(8),
                                          margin: EdgeInsets.only(left: 16,right: 16,top: 8),
                                      child:Column(

                                        children: <Widget>[
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Container(child:
                                              Column(
                                                children: <Widget>[
                                                  Container(
                                                      child: Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: <Widget>[
                                                          Container(
                                                              padding:EdgeInsets.all(3) ,
                                                              child:Row(
                                                                children: <Widget>[

                                                                  Padding(padding: EdgeInsets.all(3)),
                                                                   previousSessionData.sessions[index].restaurantDetails.restaurantName.length>22?Text(previousSessionData.sessions[index].restaurantDetails.restaurantName.substring(0,21)+"..",style: bigBlackText,):  Text(previousSessionData.sessions[index].restaurantDetails.restaurantName,style: bigBlackText,)
                                                                ],
                                                              )),
                                                          Container(
                                                              padding:EdgeInsets.all(3) ,
                                                              child:Row(
                                                                children: <Widget>[

                                                                  Padding(padding: EdgeInsets.all(3)),
                                                                  Text(previousSessionData.sessions[index].session.startTime.substring(0,10),style: numBlackText,)
                                                                ],
                                                              )),
                                                          Container(
                                                              padding:EdgeInsets.all(3) ,
                                                              child:Row(
                                                                children: <Widget>[
                                                                  Padding(padding: EdgeInsets.all(3)),
 Text("Gross Total : ₹ "+previousSessionData.sessions[index].details.entire.finalPrices.totalPrice.toStringAsFixed(2),style: numBlackText,),
 Text( ' (Click for details)',style: smalldetailText,),
                                                                Padding(padding: EdgeInsets.all(3)),
//                                                                  Text("|| You Paid : ₹ "+"0.0",
//                                                                  // previousSessionData.sessions[index].details.individual[0].finalPrice.totalPrice.toStringAsFixed(2),
//                                                                  style: numBlackText,)
                                                                ],
                                                              )),
                                                        ],
                                                      ),
                                                    ),

                                                ],
                                              ),),
                                             Container(
                                                  padding: EdgeInsets.all(3),
                                                  child:  Container(
                                                    width: 50.0,
                                                    height: 50.0,
                                                    // margin: EdgeInsets.only(top:160,left: (MediaQuery.of(context).size.width/4)-40 ),

                                                    decoration: new BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: grey
                                                    ),
                                                    child:new Container(
                                                      margin: EdgeInsets.all(2),
                                                      decoration: new BoxDecoration(
                                                        shape: BoxShape.circle,

                                                        image: new DecorationImage(
                                                            fit: BoxFit.fill,
                                                            image: new NetworkImage(
                                                                previousSessionData.sessions[index].restaurantDetails.imageUrl)),
                                                      ),
                                                    ),

                                                  ),
                                                )
                                            ],
                                          ),
                                          Container(
                                          height: 1,
                                            color: black,
                                      )
                                        ],
                                      ),



                                      ),
                                    )):  GestureDetector(

                                 

                                       child: Container(
                                      height: 100,
                                      child: Container(
                                          padding: EdgeInsets.all(8),
                                          margin: EdgeInsets.only(left: 16,right: 16,top: 8),
                                      child:Column(

                                        children: <Widget>[
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Container(child:
                                              Column(
                                                children: <Widget>[
                                                  Container(
                                                      child: Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: <Widget>[
                                                          Container(
                                                              padding:EdgeInsets.all(3) ,
                                                              child:Row(
                                                                children: <Widget>[

                                                                  Padding(padding: EdgeInsets.all(3)),
                                                                   previousSessionData.sessions[index].restaurantDetails.restaurantName.length>22?Text(previousSessionData.sessions[index].restaurantDetails.restaurantName.substring(0,21)+"..",style: bigBlackText,):  Text(previousSessionData.sessions[index].restaurantDetails.restaurantName,style: bigBlackText,)
                                                                ],
                                                              )),
                                                          Container(
                                                              padding:EdgeInsets.all(3) ,
                                                              child:Row(
                                                                children: <Widget>[

                                                                  Padding(padding: EdgeInsets.all(3)),
                                                                  Text(previousSessionData.sessions[index].session.startTime.substring(0,10),style: numBlackText,)
                                                                ],
                                                              )),
                                                          Container(
                                                              padding:EdgeInsets.all(3) ,
                                                              child:Row(
                                                                children: <Widget>[
                                                                  Padding(padding: EdgeInsets.all(3)),
 Text("No order placed",style: numBlackText,),
                                                                  Padding(padding: EdgeInsets.all(3)),
//                                                                  Text("|| You Paid : ₹ "+"0.0",
//                                                                  // previousSessionData.sessions[index].details.individual[0].finalPrice.totalPrice.toStringAsFixed(2),
//                                                                  style: numBlackText,)
                                                                ],
                                                              )),
                                                        ],
                                                      ),
                                                    ),

                                                ],
                                              ),),
                                             Container(
                                                  padding: EdgeInsets.all(3),
                                                  child:  Container(
                                                    width: 50.0,
                                                    height: 50.0,
                                                    // margin: EdgeInsets.only(top:160,left: (MediaQuery.of(context).size.width/4)-40 ),

                                                    decoration: new BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: grey
                                                    ),
                                                    child:new Container(
                                                      margin: EdgeInsets.all(2),
                                                      decoration: new BoxDecoration(
                                                        shape: BoxShape.circle,

                                                        image: new DecorationImage(
                                                            fit: BoxFit.fill,
                                                            image: new NetworkImage(
                                                                previousSessionData.sessions[index].restaurantDetails.imageUrl)),
                                                      ),
                                                    ),

                                                  ),
                                                )
                                            ],
                                          ),
                                          Container(
                                          height: 1,
                                            color: black,
                                      )
                                        ],
                                      ),



                                      ),
                                    ));
                            },
                            childCount:previousSessionData.sessions.length>2?2:previousSessionData.sessions.length ,
                          )):
                           SliverList(
    delegate: SliverChildListDelegate(
    [
Container(child: Text("No History",style: blackNormalText,textAlign: TextAlign.center,),)

    ])),
    SliverList(
    delegate: SliverChildListDelegate(
    [
      Container(
        padding: EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            GestureDetector(child: Container(
            //  width:  (MediaQuery.of(context).size.width/2)-70,
              child: Container(
               // margin: EdgeInsets.all(5),
                width:100,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),

                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    stops: [ 0.1,0.3,0.7,0.9],
                    colors: [
//
                      Colors.pink[700],
                      Colors.pink[600],

                      Colors.pink,
                      Colors.pink[400],

                    ],),
                ),
                alignment: Alignment(-1, 0),
                child:Center(child: Text("Logout",style: TextStyle(fontSize: 14,color: Colors.white,decoration: TextDecoration.none,fontFamily: 'Raleway',fontWeight: FontWeight.w700),),),
              ),),
              onTap:(){
    check();
    Navigator.of(context).pushNamedAndRemoveUntil('/login', (Route<dynamic> route) => false);

              },
            ),

            GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MorePage()),
                );
              },
              child :Container(
                width: 100,
                height: 40,
                padding: EdgeInsets.only(top: 3,bottom: 3,left: 5,right: 5),
                decoration: new BoxDecoration(
                    border: Border.all(width: 1.0,color: primaryColor,),
                    borderRadius: new BorderRadius.all(Radius.circular(10.0)),
                    color: backgroundColor),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                        padding:EdgeInsets.all(3),
                        child: Text('More',style:  TextStyle(fontSize: 14,color: Colors.pink,decoration: TextDecoration.none,fontFamily: 'Raleway',fontWeight: FontWeight.w700),)
                    )
                  ],
                ),
              ),),
          ],
        ),
      )
    ]))



                    ]
                ))
        );
    }
    else{
        return Container(
            child:Container(
                color: backgroundColor,
                child:CustomScrollView(
                  //	controller:_scrollController ,
                    slivers: <Widget>[
                      normalHeader("Profile"),

//                      historyHeader("Previous Check Ins"),

                      SliverList(
                          delegate: SliverChildListDelegate(
                              [
                                Container(
                                 child: Column(children: <Widget>[
Container(child: Text("No History",style: blackNormalText,),),

                                 
                                
                                Container(
                                  padding: EdgeInsets.all(16),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      GestureDetector(child: Container(
                                        //  width:  (MediaQuery.of(context).size.width/2)-70,
                                        child: Container(
                                          // margin: EdgeInsets.all(5),
                                          width:100,
                                          height: 40,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10.0),

                                            gradient: LinearGradient(
                                              begin: Alignment.topRight,
                                              end: Alignment.bottomLeft,
                                              stops: [ 0.1,0.3,0.7,0.9],
                                              colors: [
//
                                                Colors.pink[700],
                                                Colors.pink[600],

                                                Colors.pink,
                                                Colors.pink[400],

                                              ],),
                                          ),
                                          alignment: Alignment(-1, 0),
                                          child:Center(child: Text("Logout",style: TextStyle(fontSize: 14,color: Colors.white,decoration: TextDecoration.none,fontFamily: 'Raleway',fontWeight: FontWeight.w700),),),
                                        ),),
                                        onTap:(){
                                          check();
//                                          Navigator.of(context).pushNamedAndRemoveUntil('/login', (Route<dynamic> route) =>false);
                                          Navigator.popAndPushNamed(context,'/login');

                                        },
                                      ),

                                      GestureDetector(
                                        onTap: (){
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => MorePage()),
                                          );
                                        },
                                        child :Container(
                                          width: 100,
                                          height: 40,
                                          padding: EdgeInsets.only(top: 3,bottom: 3,left: 5,right: 5),
                                          decoration: new BoxDecoration(
                                              border: Border.all(width: 1.0,color: primaryColor,),
                                              borderRadius: new BorderRadius.all(Radius.circular(10.0)),
                                              color: backgroundColor),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: <Widget>[
                                              Container(
                                                  padding:EdgeInsets.all(3),
                                                  child: Text('More',style:  TextStyle(fontSize: 14,color: Colors.pink,decoration: TextDecoration.none,fontFamily: 'Raleway',fontWeight: FontWeight.w700),)
                                              )
                                            ],
                                          ),
                                        ),),
                                    ],
                                  ),
                                )]))
                              ]))



                    ]
                ))
        );
    }
    }})*/
//      Center(
//          child: RaisedButton(
//            elevation: 5,
//            shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10.0)),
//            color: Theme.of(context).accentColor,
//            child: Text('Logout',style: TextStyle(color: Colors.white),),
//            onPressed: (){

//
//            },)
//      ),
    );
  }
}
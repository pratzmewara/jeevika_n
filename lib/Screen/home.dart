import 'package:flutter/material.dart';
import 'package:jeevika_n/Screen/HomepageElements/cookingOrdering.dart';
class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeState();
  }

}

class HomeState extends State<Home>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
        children: <Widget>[
         GestureDetector(
             onTap: (){
               Navigator.push(
                 context,
                 MaterialPageRoute(builder: (context) => CookingOrdering()),
               );
             },
             child: Container(
            margin: EdgeInsets.all(16),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.grey[400],
                    offset: Offset(0.5, 0.5),
                    blurRadius: 10.0,
                  ),
                ],
                color: Colors.grey[50],
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child:Container(child: Row(
              children: <Widget>[
                Flexible(
                  child: Container(
                    color: Colors.teal,
                  ),flex: 1,
                ),
                Flexible(
                  child: Container(
                    child:Text("Cooking")
                  ),flex: 2,
                )
              ],
            )),
          )),
         GestureDetector(child:Container(
            margin: EdgeInsets.all(16),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.grey[400],
                    offset: Offset(0.5, 0.5),
                    blurRadius: 10.0,
                  ),
                ],
                color: Colors.grey[50],
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child:Container(child: Row(
              children: <Widget>[
                Flexible(
                  child: Container(
                    color: Colors.teal,
                  ),flex: 1,
                ),
                Flexible(
                  child: Container(
                      child:Text("Cleaning")
                  ),flex: 2,
                )
              ],
            )),
          ))
        ],
      ),
    );
  }

}
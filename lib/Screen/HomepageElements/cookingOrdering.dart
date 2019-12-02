import 'package:flutter/material.dart';

class CookingOrdering extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {

    return CookingOrderingState();
  }


}

class CookingOrderingState extends State<CookingOrdering>{
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text('Cooking'),
      ),
      body: Container(

      ),
    );
  }
}


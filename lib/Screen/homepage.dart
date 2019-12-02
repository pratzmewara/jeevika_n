import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jeevika_n/Screen/home.dart';
import 'package:jeevika_n/Presentation/utils.dart';

class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }

}

class HomePageState extends State<HomePage>{
  final List<Widget> _children = [
  Home(),
    PlaceholderWidget(Colors.deepOrange),
    PlaceholderWidget(Colors.green)
  ];

  int _currentIndex=0;
  @override
  Widget build(BuildContext context) {
  return Scaffold(
  appBar: AppBar(
elevation: 0,
  centerTitle: true,
  title: Text('Jeevika'),
  ),
  body: _children[_currentIndex],
  bottomNavigationBar: BottomNavigationBar(
    onTap: onTabTapped,
  currentIndex: _currentIndex, // this will be set when a new tab is tapped
  items: [
  BottomNavigationBarItem(

  icon: new Icon(Icons.home),
  title: new Text('Home'),
  ),
  BottomNavigationBarItem(
  icon: new Icon(Icons.access_time),
  title: new Text('Ongoing'),
  ),
  BottomNavigationBarItem(
  icon: Icon(Icons.person),
  title: Text('Profile')
  )
  ],
  ),
  );
  }
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }


}
class PlaceholderWidget extends StatelessWidget {
  final Color color;

  PlaceholderWidget(this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
    );
  }
}
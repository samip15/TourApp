import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tour_app/widgets/destination_carousal.dart';
import 'package:tour_app/widgets/hotel_carousel.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "/home_screen";
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  int _currentTab = 0;
  List<IconData> _icons = [
    FontAwesomeIcons.plane,
    FontAwesomeIcons.bed,
    FontAwesomeIcons.walking,
    FontAwesomeIcons.biking,
  ];

  Widget _buildIcon(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
            color: _selectedIndex == index ? Colors.green : Colors.blue,
            borderRadius: BorderRadius.circular(30.0)),
        child: Icon(
          _icons[index],
          size: 25.0,
          color: _selectedIndex == index
              ? Theme.of(context).primaryColor
              : Color(0xFFB4C1C4),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 30),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 120.0),
            child: Text(
              "What's Up:What Would You Like To Find?",
              style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: _icons
                .asMap()
                .entries
                .map(
                  (MapEntry map) => _buildIcon(map.key),
                )
                .toList(),
          ),
          DestinationCarousal(),
          SizedBox(height: 20.0),
          HotelCarousel(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentTab,
        onTap: (int value) {
          setState(() {
            _currentTab = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            label: "Search",
            icon: Icon(
              Icons.search,
              size: 30.0,
              color: Colors.black54,
            ),
          ),
          BottomNavigationBarItem(
            label: "Pizza",
            icon: Icon(
              Icons.local_pizza,
              size: 30.0,
            ),
          ),
          BottomNavigationBarItem(
            label: "Pupy",
            icon: CircleAvatar(
              radius: 15.0,
              backgroundImage: NetworkImage("http://i.imgur.com/zL4Krbz.jpg"),
            ),
          ),
        ],
      ),
    );
  }
}

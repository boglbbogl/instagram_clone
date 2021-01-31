import 'package:flutter/material.dart';

class CameraScreen extends StatefulWidget {
  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {

  int _currentIndex = 0;
  PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: <Widget>[
          Container(color: Colors.cyanAccent,),
          Container(color: Colors.pinkAccent,),
          Container(color: Colors.amberAccent,),
        ],
        onPageChanged: (index){
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 0,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black54,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(
                Icons.radio,
              ),
              label: 'GALLERY'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.radio,
              ),
              label: 'PHOTO'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.radio,
              ),
              label: 'VIDEO'),
        ],
        currentIndex: _currentIndex,
        onTap: _onItemTabbed,
      ),
    );
  }

  void _onItemTabbed(int index) {
    return setState(() {
          _currentIndex = index;
          _pageController.animateToPage(_currentIndex, duration: Duration(milliseconds: 200), curve: Curves.fastOutSlowIn);
        });
  }
}


import 'package:explorer/ui/likepage.dart';
import 'package:flutter/material.dart';
import '../ui/categoryPage.dart';
import '../ui/homescreen.dart';
import '../ui/loginpage.dart';

class HomeBaseScreen extends StatefulWidget {
  const HomeBaseScreen({Key? key}) : super(key: key);

  @override
  State<HomeBaseScreen> createState() => _HomeBaseScreenState();
}

class _HomeBaseScreenState extends State<HomeBaseScreen> {

  PageController _pageController = PageController();
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    LikedPage(),
    CategoryPage(),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    _pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Builder(
        builder: (context){
          return IconButton(
          onPressed: ()=> Scaffold.of(context).openDrawer(),
          icon: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Image.asset('assets/icons/menu.png'),
          ));
        },
        ),
        elevation: 0.0,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.logo_dev,
              color: Colors.grey,
              size: 30,
            ),
            Text(
              'AppName',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
            ),
          ],
        ),
        actions: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Icon(Icons.search, color: Colors.black87),
          ),
        ],

      ),
      drawer: Drawer(

      ),
      body: Center(
        child: PageView(
          controller: _pageController,
          children: _widgetOptions,
          pageSnapping: true,
          scrollDirection: Axis.horizontal,
          physics: NeverScrollableScrollPhysics(),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black87,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline),
            label: 'Like',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category_outlined),
            label: 'Categories',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

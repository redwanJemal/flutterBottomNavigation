import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home Page',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}


class HomePage extends StatefulWidget{

  _HomePageState createState() => _HomePageState();
}

const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
class _HomePageState extends State<HomePage>{
  int _page = 0;
  PageController _pageController ;

  @override
  void initState() {
    super.initState();
    _pageController = new PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void navigationTapped(int page) {
    // Animating to the page.
    // You can use whatever duration and curve you like
    _pageController.animateToPage(page,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  void onPageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BottomNav'),
      ),
      body: new PageView(
        children: [
          new Home(title: "Home Page",),
          new Location(title: "Location screen"),
          new Friends(title: "Friends screen"),
        ],
        onPageChanged: onPageChanged,
        controller: _pageController,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            title: Text('Business'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            title: Text('School'),
          ),
        ],
        currentIndex: _page,
        selectedItemColor: Colors.amber[800],
        onTap: navigationTapped,
      ),
    );
  }
}

class Home extends StatelessWidget{
  final String title;
  Home({Key key,this.title}): super(key:key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        child: Center(
          child: Text('$title',style: optionStyle,),
        ),
      ),
    );
  }
}

class Location extends StatelessWidget{
  final String title;
  Location({Key key,this.title}): super(key:key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        child: Center(
          child: Text('$title',style: optionStyle,),
        ),
      ),
    );
  }
}
class Friends extends StatelessWidget{
  final String title;
  Friends({Key key,this.title}): super(key:key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        child: Center(
          child: Text('$title',style: optionStyle,),
        ),
      ),
    );
  }
}


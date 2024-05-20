import 'package:flutter/material.dart';
import 'package:sutori_app/add_story_screen.dart';
import 'package:sutori_app/info_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _appBar(context),
        body: InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AddStoryScreen()));
          },
          child: Hero(
            tag: 'image_animation',
            child: Center(
                child: Image.asset(
              'kilua.jpg',
              width: 200,
              height: 200,
            )),
          ),
        ),
        drawer: _drawer(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          tooltip: 'Add Story',
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AddStoryScreen()));
          },
          backgroundColor: Colors.brown,
          foregroundColor: Colors.white,
          shape: CircleBorder(),
          child: const Icon(Icons.add),
        ),
        bottomNavigationBar: _bottomNavigationBar());
  }

  BottomNavigationBar _bottomNavigationBar() {
    return BottomNavigationBar(
        backgroundColor: Colors.brown,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
        ]);
  }

  Drawer _drawer() {
    return Drawer(
      child: ListView(
        children: const [
          DrawerHeader(
              child: Text(
            'Profil',
            style: TextStyle(
                color: Colors.brown, fontWeight: FontWeight.bold, fontSize: 21),
          )),
          ListTile(
            leading: Icon(Icons.account_circle, color: Colors.brown),
            title: Text(
              'Profil',
              style: TextStyle(color: Colors.brown),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              color: Colors.brown,
            ),
            title: Text(
              'Setting',
              style: TextStyle(color: Colors.brown),
            ),
          )
        ],
      ),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
        iconTheme: const IconThemeData(color: Colors.brown),
        title: const Text(
          'Sutori App',
          style: TextStyle(
              color: Colors.brown, fontWeight: FontWeight.bold, fontSize: 26),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications,
                color: Colors.brown,
              )),
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => InfoDetailScreen()));
              },
              icon: const Icon(
                Icons.info,
                color: Colors.brown,
              ))
        ]);
  }
}

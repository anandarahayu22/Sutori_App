import 'package:flutter/material.dart';
import 'package:sutori_app/add_story_screen.dart';
import 'package:sutori_app/info_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _appBar(context),
        body: Center(
            child: TextButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Perhatian!'),
                          content: Text('Maaf Toko Tutup Sementara'),
                          actions: <Widget>[
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('Ok'))
                          ],
                        );
                      });
                },
                child: Text('MAU MAKAN APA HARI INI??'))),
        drawer: _drawer(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          tooltip: 'Add Pesanan',
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AddStoryScreen()));
          },
          backgroundColor: Color(0xFF5D4037),
          foregroundColor: Colors.white,
          shape: CircleBorder(),
          child: Icon(Icons.add),
        ),
        bottomNavigationBar: _bottomNavigationBar());
  }

  BottomNavigationBar _bottomNavigationBar() {
    return BottomNavigationBar(
        backgroundColor: Color(0xFF5D4037),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.local_dining_rounded), label: 'Menu'),
        ]);
  }

  Drawer _drawer() {
    return Drawer(
      // child: Container(
      // color: Color.fromARGB(255, 0, 44, 45),
      child: ListView(
        children: const [
          DrawerHeader(
              child: Text(
            'Sutori',
            style: TextStyle(
                color: Color(0xFF5D4037),
                fontWeight: FontWeight.bold,
                fontSize: 21),
          )),
          ListTile(
            leading: Icon(Icons.account_circle, color: Color(0xFF795548)),
            title: Text(
              'Profil',
              style: TextStyle(color: Color(0xFF5D4037)),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.content_paste,
              color: Color(0xFF5D4037),
            ),
            title: Text(
              'Transaksi',
              style: TextStyle(color: Color(0xFF5D4037)),
            ),
          )
        ],
      ),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      title: Text(
        'Sutori',
        style: TextStyle(
          color: Colors.white, // Warna teks
        ),
      ),
      backgroundColor: Color(0xFF5D4037),
      centerTitle: true,
      actions: [
        IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => InfoDetailScreen()));
            },
            icon: Icon(
              Icons.shopping_cart_checkout_rounded,
              color: Colors.white,
            ))
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'constant.dart'; 
import 'driver_tab.dart';
import 'user_tab.dart';
import 'rating.dart';
import 'keranjang.dart';
import 'profil.dart';

class BerandaPage extends StatefulWidget {
  const BerandaPage({Key? key}) : super(key: key);

  @override
  _BerandaPageState createState() => _BerandaPageState();
}

class _BerandaPageState extends State<BerandaPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BerandaPage()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => RatingPage()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => KeranjangPage()),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProfilPage()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: primaryButtonColor,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50), 
          child: Container(
            color: primaryButtonColor, 
            child: TabBar(
              controller: _tabController,
              tabs: [
                Tab(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 55),
                    decoration: BoxDecoration(
                      color: _tabController.index == 0 ? backgroundColor : Colors.transparent,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: Text(
                      'Driver',
                      style: textTextStyle.copyWith(
                        color: textColor,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 55),
                    decoration: BoxDecoration(
                      color: _tabController.index == 1 ? backgroundColor : Colors.transparent,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: Text(
                      'User',
                      style: textTextStyle.copyWith(
                        color: textColor,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ],
              indicatorColor: Colors.transparent,
              onTap: (index) {
                setState(() {
                  _tabController.index = index;
                });
              },
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_outlined, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          DriverTab(),
          UserTab(),
        ],
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      backgroundColor: backgroundColor,
      type: BottomNavigationBarType.fixed,
      iconSize: 30,
      selectedItemColor: navigationColor,
      unselectedItemColor: textColor,
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: ''),
      ],
    );
  }
}

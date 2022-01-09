import 'package:flutter/material.dart';
import 'package:shamo/pages/home/home_page.dart';
import 'package:shamo/pages/home/profile_page.dart';
import 'package:shamo/pages/home/wishlist_page.dart';
import 'package:shamo/theme.dart';

import 'chat_page.dart';

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  // properti
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {

    // Widget cart floating action button
    Widget cartFloatingBtn(){
      return FloatingActionButton(
        onPressed: (){
          Navigator.pushNamed(context, '/cart');
        },
        backgroundColor: secondaryColor,
        child: Image.asset(
          'assets/icon_cart.png',
          width: 20,
        ),
      );
    }

    // Widget bottom navigation
    Widget customNavBottom(){
      return ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        child: BottomAppBar(
          color: bgColor4,
          shape: CircularNotchedRectangle(),
          notchMargin: 10,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: BottomNavigationBar(
            backgroundColor: bgColor4,
            type: BottomNavigationBarType.fixed,
            currentIndex: currentPage,
            onTap: (value){
              setState(() {
                currentPage = value;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(
                    top: 20,
                    bottom: 10
                  ),
                  child: Image.asset(
                    'assets/icon_home.png', 
                    width: 20, 
                    color: currentPage == 0 ? primaryColor : Color(0xff808191),
                  ),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Container(
                   margin: EdgeInsets.only(
                    top: 20,
                    bottom: 10
                  ),
                  child: Image.asset(
                    'assets/icon_chat.png', 
                    width: 20,
                    color: currentPage == 1 ? primaryColor : Color(0xff808191),
                  ),
                ),
                label: ''
              ),
              BottomNavigationBarItem(
                icon: Container(
                   margin: EdgeInsets.only(
                    top: 20,
                    bottom: 10
                  ),
                  child: Image.asset(
                    'assets/icon_favorite.png', 
                    width: 20,
                    color: currentPage == 2 ? primaryColor : inactiveIcon,
                  ),
                ),
                label: ''
              ),
              BottomNavigationBarItem(
                icon: Container(
                   margin: EdgeInsets.only(
                    top: 20,
                    bottom: 10
                  ),
                  child: Image.asset(
                    'assets/icon_profile.png', 
                    width: 18,
                    color: currentPage == 3 ? primaryColor : inactiveIcon,
                  ),
                ),
                label: ''
              ),
            ],
          ),
        ),
      );
    }

    // Widget body
    Widget body(){
      switch (currentPage) {
        case 0:
          return HomePage();
          break;
        case 1:
          return ChatPage();
          break;
        case 2:
          return WishlistPage();
          break;
        case 3:
          return ProfilePage();
          break;  
        default:
          return HomePage();
      }
    }

    return Scaffold(
        backgroundColor: bgColor1,
        floatingActionButton: cartFloatingBtn(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: customNavBottom(),
        body: SafeArea(
          child: body()
        ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/models/user_model.dart';
import 'package:shamo/providers/auth_provider.dart';

import '../../theme.dart';

class ProfilePage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

  AuthProvider authProvider = Provider.of<AuthProvider>(context); 
  UserModel user = authProvider.user;

     // Widget header
  Widget header(){
    return AppBar(
      backgroundColor: bgColor3,
      centerTitle: true,
      elevation: 0,
      flexibleSpace: SafeArea(
        child: Container(
          padding: EdgeInsets.all(defaultMargin),
          child: Row(
            children: [
              Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                      user.profile_pict,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 16,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Halo, ${user.nama}', style: primaryTextStyle.copyWith(
                      fontSize: 24,
                      fontWeight: semibold
                    )),
                    Text('@${user.username}', style: thirdTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: reguler
                    ),)
                  ],
                ),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.pushNamedAndRemoveUntil(context, '/sign-in', (route) => false);
                },
                child: Image.asset(
                  'assets/icon_logout.png',
                  width: 20,
                ),
              )

            ],
          ),
        )
      ),
      automaticallyImplyLeading: false,
    );
  }

  // widget menu item
  Widget menuItem(String text){
    return Container(
      margin: EdgeInsetsDirectional.only(
        top:16
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text, style: secondaryTextStyle,),
          Icon(Icons.chevron_right, color: primaryTextColor,)
        ],
      ),
    );
  }

  // Widget content
  Widget content(){
    return Expanded(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: defaultMargin
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20,),
            Text('Account', style: primaryTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semibold
            ),),
            SizedBox(height: 18,),
            GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, '/edit-profile');
              },
              child: menuItem('Edit Profile')
            ),
            menuItem('Your Order'),
            menuItem('Help'),
            SizedBox(height: 30,),
            Text('Account', style: primaryTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semibold
            ),),
            menuItem('Pricacy & Policy'),
            menuItem('Term Of Service'),
            menuItem('Rate App'),
          ],
        ),
      ),
    );
  }

  return Column(
    children: [
      header(),
      content()
    ],
  );
  }
}
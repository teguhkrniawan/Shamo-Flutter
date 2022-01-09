import 'package:flutter/material.dart';
import 'package:shamo/theme.dart';

class EditProfilePage extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    
    Widget header(){
      return AppBar(
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        backgroundColor: bgColor1,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Edit Profile'
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.check,
            ),
            onPressed: (){
              
            },
            color: primaryColor,
          )
        ],
      );
    }

    // Widget name input
    Widget nameInput(){
      return Container(
        width: double.infinity,
        margin: EdgeInsets.only(
          top: 30
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              Text(
                'Name',
                style: secondaryTextStyle.copyWith(
                  fontSize: 13
                ),
              ),
              TextFormField(
                style: primaryTextStyle,
                decoration: InputDecoration(
                  hintText: 'Teguh Kurniawan',
                  hintStyle: primaryTextStyle,
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: thirdTextColor
                    )
                  )
                ),
              )
          ],
        ),
      );
    }

    // Widget username input
    Widget usernameInput(){
      return Container(
        width: double.infinity,
        margin: EdgeInsets.only(
          top: 30
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              Text(
                'Username',
                style: secondaryTextStyle.copyWith(
                  fontSize: 13
                ),
              ),
              TextFormField(
                style: primaryTextStyle,
                decoration: InputDecoration(
                  hintText: '@teguhkrniawan',
                  hintStyle: primaryTextStyle,
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: thirdTextColor
                    )
                  )
                ),
              )
          ],
        ),
      );
    }

    // Widget email
    Widget emailInput(){
      return Container(
        width: double.infinity,
        margin: EdgeInsets.only(
          top: 30
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              Text(
                'Email',
                style: secondaryTextStyle.copyWith(
                  fontSize: 13
                ),
              ),
              TextFormField(
                style: primaryTextStyle,
                decoration: InputDecoration(
                  hintText: 'teguhkrniawan@gmail.com',
                  hintStyle: primaryTextStyle,
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: thirdTextColor
                    )
                  )
                ),
              )
          ],
        ),
      );
    }

    // Widget content
    Widget content(){
      return Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: defaultMargin
        ),
        child: Column(
          children: [
            Container(
              width: 100,
              height: 100,
              margin: EdgeInsets.only(
                top: defaultMargin
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/icon_user.png'),
                ),
              ),
            ),
            nameInput(),
            usernameInput(),
            emailInput()
          ],
        ),
      );
    }
    
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: bgColor3,
      appBar: header(),
      body: content(),
    );
  }
}
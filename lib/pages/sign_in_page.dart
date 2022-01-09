import 'package:flutter/material.dart';
import 'package:shamo/theme.dart';

class SignInPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    // header widget
    Widget header(){
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Login',
              style: primaryTextStyle.copyWith(
                fontSize: 24,
                fontWeight: semibold
              ),
            ),
            SizedBox(height: 2,),
            Text(
              'Sign in to continue',
              style: thirdTextStyle.copyWith(
                fontSize: 14,
                fontWeight: reguler
              ),
            ),
          ],
        ),
      );
    }

    // form label and editText email
    Widget emailInput(){
      return Container(
        margin: EdgeInsets.only(top: 70),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Email Adrress',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium
              ),
            ),
            SizedBox(height: 12,),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: bgColor2,
                borderRadius: BorderRadius.circular(12)
              ),
              child: Center(
                child: Row(
                  children: [
                    Image.asset('assets/icon_email.png', width: 17,),
                    SizedBox(width: 16,),
                    Expanded(
                      child: TextFormField(
                        style: primaryTextStyle,
                        decoration: InputDecoration.collapsed(
                          hintText: "Your Email Address",
                          hintStyle: thirdTextStyle
                        ),
                      )
                    )
                  ],
                ),
              ),
            )
          ],
        )
      );
    }

    // form label and editText Password
     Widget passwordInput(){
      return Container(
        margin: EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Password',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium
              ),
            ),
            SizedBox(height: 12,),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: bgColor2,
                borderRadius: BorderRadius.circular(12)
              ),
              child: Center(
                child: Row(
                  children: [
                    Image.asset('assets/icon_password.png', width: 17,),
                    SizedBox(width: 16,),
                    Expanded(
                      child: TextFormField(
                        obscureText: true,
                        style: primaryTextStyle,
                        decoration: InputDecoration.collapsed(
                          hintText: "Your Password",
                          hintStyle: thirdTextStyle
                        ),
                      )
                    )
                  ],
                ),
              ),
            )
          ],
        )
      );
    }

    // button sign in
    Widget SignInButton(){
      return Container(
        height: 50,
        width: double.infinity,
        margin: EdgeInsets.only(top: 30),
        child: TextButton(
          onPressed: (){
            Navigator.pushNamed(context, '/home');
          }, 
          style: TextButton.styleFrom(
            backgroundColor: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12)
            )
          ),
          child: Text('Sign In', style: primaryTextStyle.copyWith(
            fontSize: 16,
            fontWeight: medium 
          ),)
        ),
      );
    }

    // footer text
    Widget footer(){
      return Container(
          margin: EdgeInsets.only(bottom: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Don't have an account?", style: thirdTextStyle.copyWith(
                fontSize: 12,
                fontWeight: reguler
              )),
              SizedBox(width: 3,),
              GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, '/sign-up');
                },
                child: Text(
                  'Sign Up', style: purpleTextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: medium
                  ),
                ),
              )
            ],
          ),
      );
    }

    return Scaffold(
        backgroundColor: bgColor1,
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: defaultMargin
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                header(),
                emailInput(),
                passwordInput(),
                SignInButton(),
                Spacer(),
                footer()
              ],
            ),
          ),
        )
    );
  }
}
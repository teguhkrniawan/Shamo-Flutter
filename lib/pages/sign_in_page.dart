import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/providers/auth_provider.dart';
import 'package:shamo/theme.dart';
import 'package:shamo/widgets/loading_button.dart';

class SignInPage extends StatefulWidget {

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController(text: '');

  TextEditingController passController = TextEditingController(text: '');

  bool _isLoading = false;

  // overiding context
  @override
  Widget build(BuildContext context) {

    // provider
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    
    handleSignIn() async{
      setState(() {
        _isLoading = true;
      });

      if(await authProvider.login(
        email: emailController.text,
        password: passController.text
      )){
        Navigator.pushNamed(context, '/home');
      }
      else{
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: bgColor7,
            content: authProvider.exception == ""
                ? Text('Sorry! Failed to login, try again', style: primaryTextStyle.copyWith(fontSize: 12))
                : Text('${authProvider.exception}, please check your username or password', style: primaryTextStyle.copyWith(fontSize: 12))
          )  
        );
      }

      setState(() {
        _isLoading = false;
      });
    }

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
                        controller: emailController,
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
                        controller: passController,
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
          onPressed: handleSignIn, 
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
                _isLoading ? LoadingButton() : SignInButton(),
                Spacer(),
                footer()
              ],
            ),
          ),
        )
    );
  }
}
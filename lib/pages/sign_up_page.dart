import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/providers/auth_provider.dart';
import 'package:shamo/theme.dart';
import 'package:shamo/widgets/loading_button.dart';

class SignUpPage extends StatefulWidget {

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  // controller
  TextEditingController nameController = TextEditingController(text: '');
  TextEditingController usernameController = TextEditingController(text: '');
  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');

  // variabel status apakah dia loading atau gak
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {

    // provider
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    // handle signup
    handleSignUp() async {

       // set state nilai isLoading jadi true saat button di tap
       setState(() {
         isLoading = true;
       });

       // menunggu return dari registrasi
       if(await authProvider.register(
         name: nameController.text,
         username: usernameController.text,
         email: emailController.text,
         password: passwordController.text
       )){
         // navigasikan ke router /home
         Navigator.pushNamed(context, '/home');
       }else{
           ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: bgColor7,
                content: Text("Sorry, Register Failed, try again!", style: primaryTextStyle.copyWith(
                  fontSize: 12
                ),)
              )  
            );
       }

       // apabila kode await diatas sudah di eksekusi dan mereturn value maka
       // lanjutkan kode dibawah berikut

       setState(() {
         isLoading = false;
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
              'Sign Up',
              style: primaryTextStyle.copyWith(
                fontSize: 24,
                fontWeight: semibold
              ),
            ),
            SizedBox(height: 2,),
            Text(
              'Register and Happy Shopping',
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
                        controller: emailController,
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
                        controller: passwordController,
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

    // form input username 
    Widget usernameInput(){
      return Container(
        margin: EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Username',
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
                    Image.asset('assets/icon_username.png', width: 17,),
                    SizedBox(width: 16,),
                    Expanded(
                      child: TextFormField(
                        controller: usernameController,
                        style: primaryTextStyle,
                        decoration: InputDecoration.collapsed(
                          hintText: "Your Username",
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

    // widget fullname input
    Widget fullNameInput(){
        return Container(
        margin: EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Fullname',
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
                    Image.asset('assets/icon_fullname.png', width: 17,),
                    SizedBox(width: 16,),
                    Expanded(
                      child: TextFormField(
                        controller: nameController,
                        style: primaryTextStyle,
                        decoration: InputDecoration.collapsed(
                          hintText: "Your Fullname",
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

    // button sign up
    Widget SignUpButton(){

      return Container(
        height: 50,
        width: double.infinity,
        margin: EdgeInsets.only(top: 30),
        child: TextButton(
          onPressed: handleSignUp, 
          style: TextButton.styleFrom(
            backgroundColor: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12)
            )
          ),
          child: Text('Sign Up', style: primaryTextStyle.copyWith(
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
              Text("Already have an account?", style: thirdTextStyle.copyWith(
                fontSize: 12,
                fontWeight: reguler
              )),
              SizedBox(width: 3,),
              GestureDetector(
                onTap: (){
                  Navigator.pop(context, '/sign-in');
                },
                child: Text(
                  'Sign In', style: purpleTextStyle.copyWith(
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
                fullNameInput(),
                usernameInput(),
                passwordInput(),
                isLoading ? LoadingButton() : SignUpButton(),
                Spacer(),
                footer()
              ],
            ),
          ),
        )
    );
  }
}
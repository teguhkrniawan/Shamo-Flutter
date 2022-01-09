import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/pages/cart_page.dart';
import 'package:shamo/pages/checkout_page.dart';
import 'package:shamo/pages/checkout_success.dart';
import 'package:shamo/pages/detail_chat_page.dart';
import 'package:shamo/pages/detail_product_page.dart';
import 'package:shamo/pages/edit_profile_page.dart';
import 'package:shamo/pages/home/main_page.dart';
import 'package:shamo/pages/sign_in_page.dart';
import 'package:shamo/pages/sign_up_page.dart';
import 'package:shamo/pages/splash_page.dart';
import 'package:shamo/providers/auth_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider()
        )
      ],
      child: MaterialApp( 
          debugShowCheckedModeBanner: false,
          routes: {
            '/' : (context) => SplashPage(),
            '/sign-in' : (context) => SignInPage(),
            '/sign-up' : (context) => SignUpPage(),
            '/home' : (context) => MainPage(),
            '/detail-chat' : (context) => DetailChatPage(),
            '/edit-profile' : (context) => EditProfilePage(),
            '/detail-product' : (context) => DetailProduct(),
            '/cart' : (context) => CartPage(),
            '/checkout': (context) => CheckoutPage(),
            '/checkout-success' : (context) => CheckoutSuccess()
          },
      ),
    );
  }
}

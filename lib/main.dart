import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vincare/unit.dart';
import 'package:vincare/view/auth/forget_password_page.dart';
import 'package:vincare/view/auth/login_page.dart';
import 'package:vincare/view/auth/register_page.dart';
import 'package:vincare/view/cart/cart_details_page.dart';
import 'package:vincare/view/cart/cart_page.dart';
import 'package:vincare/view/home/home_page.dart';
import 'package:vincare/view/product/product_category_page.dart';
import 'package:vincare/view/product/product_detail_page.dart';
import 'package:vincare/view/search/search_page.dart';

import 'view/blog/blog_detail.dart';
import 'view/cart/checkout_page.dart';
import 'view/dashboard/dashboard_page.dart';
import 'view/order/order_detail_page.dart';
import 'view/order/order_history_page.dart';
import 'view/product/all_category_page.dart';
import 'view/user/change_password_page.dart';
import 'view/user/privacy_policy_page.dart';
import 'view/user/user_info_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        progressIndicatorTheme: ProgressIndicatorThemeData(color: pColor),
        primaryColor: pColor,
        appBarTheme: AppBarTheme(
          backgroundColor: pColor,
        ),
      ),
      debugShowCheckedModeBanner: false,
      title: 'TopZone',
      home: DashboardPage(),
      getPages: [
        GetPage(
          name: ('/login'),
          page: () => LoginPage(),
        ),
        GetPage(
          name: ('/search'),
          page: () => SearchPage(),
        ),
        GetPage(
          name: ('/register'),
          page: () => RegisterPage(),
        ),
        GetPage(
          name: ('/forgetPassword'),
          page: () => ForgetPasswordPage(),
        ),
        GetPage(
          name: ('/homePage'),
          page: () => HomePage(),
        ),
        GetPage(
          name: ('/productCategory'),
          page: () => ProductCategory(),
        ),
        GetPage(
          name: ('/productDetail'),
          page: () => ProductDetailPage(),
        ),
        GetPage(
          name: ('/cartDetail'),
          page: () => CartDetailPage(),
        ),
        GetPage(
          name: ('/cart'),
          page: () => const CartPage(),
        ),
        GetPage(
          name: ('/checkout'),
          page: () => CheckoutPage(),
        ),
        GetPage(
          name: ('/blogDetail'),
          page: () => BlogDetailPage(),
        ),
        GetPage(
          name: ('/dashboardPage'),
          page: () => DashboardPage(),
        ),
        GetPage(
          name: ('/userInfoPage'),
          page: () => UserInfoPage(),
        ),
        GetPage(
          name: ('/changePassword'),
          page: () => ChangePasswordPage(),
        ),
        GetPage(
          name: ('/orderHistory'),
          page: () => OrderHistoryPage(),
        ),
        GetPage(
          name: ('/allCategory'),
          page: () => const AllCategoryPage(),
        ),
        GetPage(
          name: ('/privacyPolicy'),
          page: () => const PrivacyPolicyPage(),
        ),
        GetPage(
          name: ('/orderDetail'),
          page: () => OrderDetailPage(),
        ),
      ],
    );
  }
}

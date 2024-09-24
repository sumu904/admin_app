import 'package:admin_app/features/auth/screens/sign_in_screen.dart';
import 'package:admin_app/features/order/screens/order_details_screen.dart';
import 'package:admin_app/features/home/screens/home_screen.dart';
import 'package:admin_app/features/splash/screens/splash_screen.dart';
import 'package:get/get.dart';

class RouteHelper {
  static const String initial = '/';
  static const String splash = '/splash';
  static const String orderDetails = '/orderDetails';
  static const String signIn = '/sign-in';
  static const String testDemo = '/test-demo';

  static String getInitialRoute() => initial;
  static String getSplashRoute() => splash;
  static String getOrderDetailsRoute() => orderDetails;
  static String getSignInRoute() => signIn;
  static String getTestDemo() => testDemo;

  static List<GetPage> routes = [
    GetPage(name: initial, page: () => const HomeScreen()),
    GetPage(name: splash, page: () => const SplashScreen()),
    GetPage(name: orderDetails, page: () => const OrderDetailsScreen()),
    GetPage(name: signIn, page: () => const SignInScreen()),
  ];
}
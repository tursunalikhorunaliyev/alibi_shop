import 'package:alibi_shop/feature/allproduct/screen/all_product_screen.dart';
import 'package:alibi_shop/feature/auth/check_code/screen/check_code_screen.dart';
import 'package:alibi_shop/feature/auth/congrats_screen/screen/congrats_screen.dart';
import 'package:alibi_shop/feature/auth/phone_number/screen/phone_number_screen.dart';
import 'package:alibi_shop/feature/category/screen/category_screen.dart';
import 'package:alibi_shop/feature/home/home/screen/home_screen.dart';
import 'package:alibi_shop/feature/profile/screen/profile_screen.dart';
import 'package:alibi_shop/feature/shopprod/screen/shop_product_screen.dart';
import 'package:alibi_shop/service/navigation/navigation_service.dart';
import 'package:alibi_shop/service/transition/transitions.dart';
import 'package:go_router/go_router.dart';

class AppGoRouter {
  final router = GoRouter(
    navigatorKey: NavigationService.navigatorKey,
    initialLocation: ShopProductScreen.routeName,
    routes: [
      ///main
      GoRoute(
        path: PhoneNumberScreen.routeName,
        pageBuilder: (context, state) => slideTransitionRight(
          state,
          const PhoneNumberScreen(),
        ),
      ),
      GoRoute(
        path: CheckCodeScreen.routeName,
        pageBuilder: (context, state) => slideTransitionRight(
          state,
          const CheckCodeScreen(),
        ),
      ),
      GoRoute(
        path: CongratsScreen.routeName,
        pageBuilder: (context, state) => slideTransitionRight(
          state,
          const CongratsScreen(),
        ),
      ),
      GoRoute(
        path: HomeScreen.routeName,
        pageBuilder: (context, state) => slideTransitionRight(
          state,
          const HomeScreen(),
        ),
      ),
      GoRoute(
        path: ShopProductScreen.routeName,
        pageBuilder: (context, state) => slideTransitionRight(
          state,
          const ShopProductScreen(),
        ),
      ),
      GoRoute(
        path: CategoryScreen.routeName,
        pageBuilder: (context, state) => slideTransitionRight(
          state,
          const CategoryScreen(),
        ),
      ),
      GoRoute(
        path: ProfileScreen.routeName,
        pageBuilder: (context, state) => slideTransitionRight(
          state,
          const ProfileScreen(),
        ),
      ),
      GoRoute(
        path: AllProductScreen.routeName,
        pageBuilder: (context, state) => slideTransitionRight(
          state,
          const AllProductScreen(),
        ),
      ),
    ],
  );
}

import 'package:alibi_shop/feature/auth/phone_number/screen/phone_number_screen.dart';
import 'package:alibi_shop/feature/home/home_screen.dart';
import 'package:alibi_shop/service/navigation/navigation_service.dart';
import 'package:alibi_shop/service/transition/transitions.dart';
import 'package:go_router/go_router.dart';

class AppGoRouter {
  final router = GoRouter(
    navigatorKey: NavigationService.navigatorKey,
    initialLocation: HomeScreen.routeName,
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
        path: HomeScreen.routeName,
        pageBuilder: (context, state) => slideTransitionRight(
          state,
          const HomeScreen(),
        ),
      ),
    ],
  );
}

import 'package:go_router/go_router.dart';
import 'package:newsapp/Featuers/home/presentation/view/home_view.dart';
import 'package:newsapp/Featuers/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const kSplashView = '/';
  static const kHomeView = '/homeView';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) {
          return const SplashView();
        },
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) {
          return const HomeView();
        },
      )
    ],
  );
}

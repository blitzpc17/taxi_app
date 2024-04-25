import 'package:go_router/go_router.dart';
import 'package:taxi_app/screens/screens.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(
      path:'/home',
      builder: (context, state) => const HomeScreen() 
    ),
    GoRoute(
      path:'/',
      builder: (context, state) => const LoginScreen()
    ),
      GoRoute(
      path:'/register',
      builder: (context, state) => const RegisterScreen()
    ),

  ]
  );
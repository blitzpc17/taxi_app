import 'package:go_router/go_router.dart';
import 'package:taxi_app/screens/historial_screen.dart';
import 'package:taxi_app/screens/perfil_screen.dart';
import 'package:taxi_app/screens/screens.dart';

final appRouter = GoRouter(routes: [
  GoRoute(path: '/home', builder: (context, state) => const HomeScreen()),
  GoRoute(path: '/', builder: (context, state) => const HistorialScreen()),
  GoRoute(
      path: '/register', builder: (context, state) => const RegisterScreen()),
  GoRoute(path: '/perfil', builder: (context, state) => const PerfilScreen()),
  GoRoute(
      path: '/historial', builder: (context, state) => const HistorialScreen()),
]);

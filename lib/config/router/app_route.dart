import 'package:go_router/go_router.dart';
import 'package:taxi_app/screens/historial_screen.dart';
import 'package:taxi_app/screens/perfil_screen.dart';
import 'package:taxi_app/screens/screens.dart';

final appRouter = GoRouter(routes: [
  GoRoute(
      path: '/home',
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen()),
  GoRoute(path: '/', builder: (context, state) => RegisterScreen()),
  GoRoute(
      path: '/register',
      name: RegisterScreen.name,
      builder: (context, state) => RegisterScreen()),
  GoRoute(path: '/perfil', builder: (context, state) => const PerfilScreen()),
  GoRoute(
      path: '/historial', builder: (context, state) => const HistorialScreen()),
  GoRoute(
      path: '/solicitudviaje',
      builder: (context, state) => const SolicitarViajeScreen()),
]);

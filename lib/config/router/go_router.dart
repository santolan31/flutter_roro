import 'package:flutter_roro/presentation/screens/home_screen.dart';
import 'package:flutter_roro/presentation/screens/login_screen.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(initialLocation: "/", 
routes: [

  GoRoute(
    name: HomeScreen.name,
    path: "/",
    builder: (context, state) => HomeScreen(),
    ),

    GoRoute(
    name: LoginScreens.name,
    path: "/login",
    builder: (context, state) => LoginScreens(),
    )
]);

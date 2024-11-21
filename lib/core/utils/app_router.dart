import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_list_app/features/edit_todo/presentation/views/edit_note_view.dart';
import 'package:todo_list_app/features/home/data/models/todo_item_model.dart';
import 'package:todo_list_app/features/home/presentation/views/home_view.dart';
import 'package:todo_list_app/features/splash/presentation/views/splash_view.dart';

class AppRouter {
  static const String initialRoute = '/';
  static const String homeRoute = '/home';
  static const String editRoute = '/edit';

  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: initialRoute,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: homeRoute,
        pageBuilder: (context, state) => buildPageWithFadeTransition(
          context: context,
          state: state,
          child: const HomeView(),
        ),
      ),
      GoRoute(
        path: editRoute,
        pageBuilder: (context, state) => buildPageWithFadeTransition(
          context: context,
          state: state,
          child: EditNoteView(
            model: state.extra as TodoItemModel,
          ),
        ),
      ),
    ],
  );
}

CustomTransitionPage buildPageWithFadeTransition({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
  int? durationInMS = 300,
}) {
  return CustomTransitionPage<void>(
    key: state.pageKey,
    child: child,
    transitionDuration: Duration(
      milliseconds: durationInMS ?? 300,
    ),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(opacity: animation, child: child);
    },
  );
}

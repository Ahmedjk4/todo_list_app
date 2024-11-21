import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_list_app/constants.dart';
import 'package:todo_list_app/core/utils/app_router.dart';
import 'package:todo_list_app/core/utils/assets.dart';
import 'bouncing_text.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          AppAssets.splashPath6,
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,
          fit: BoxFit.cover,
        ),
        Image.asset(
          AppAssets.splashPath7,
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,
          fit: BoxFit.cover,
        ),
        Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BouncingText(
                text: kAppName,
                onIncomingFinish: (p0) {
                  onIncomingFinish(p0, context);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  void onIncomingFinish(Key? key, BuildContext context) {
    debugPrint('Started Splash Timer');
    Future.delayed(const Duration(seconds: 3), () {
      context.go(AppRouter.homeRoute);
    });
  }
}

import 'package:bookly_app/core/utils/app_images.dart';
import 'package:bookly_app/core/utils/app_routes.dart';
import 'package:bookly_app/features/splash/presentation/views/wigdets/sliding_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

//بيهندل امتي هتك او امتي هتطلع ذي في الساعة كل ثانية بتك
class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;
  @override
  void initState() {
    super.initState();
    initSlidinAnimation();
    navigateToHome();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(AppImages.logoImg),
        const SizedBox(
          height: 8,
        ),
        SlidingText(slidingAnimation: slidingAnimation)
      ],
    );
  }

  void initSlidinAnimation() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 4), end: Offset.zero)
            .animate(animationController);
    animationController.forward();
  }

  void navigateToHome() {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        // Get.to(() => const HomeView(),
        //     // calculations
        //     transition: Transition.fade,
        //     duration: kTranstionDuration);

        // ignore: use_build_context_synchronously
        GoRouter.of(context).push(AppRouter.kHomeView);
      },
    );
  }
}

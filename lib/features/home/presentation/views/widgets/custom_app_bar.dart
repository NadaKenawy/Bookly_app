import 'package:bookly_app/core/utils/app_images.dart';
import 'package:bookly_app/core/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 24),
        child: Row(
          children: [
            Image.asset(
              AppImages.logoImg,
              height: 22,
            ),
            const Spacer(),
            IconButton(
                onPressed: () {
                  GoRouter.of(context).push(
                    AppRouter.kSearchView,
                  );
                },
                icon: const FaIcon(
                  FontAwesomeIcons.magnifyingGlass,
                ))
          ],
        ),
      ),
    );
  }
}

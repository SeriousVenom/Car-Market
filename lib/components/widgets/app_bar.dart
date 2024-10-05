import 'package:car_market/components/ui_const.dart';
import 'package:car_market/domain/config/localization.dart';
import 'package:car_market/domain/config/navigation.dart';
import 'package:flutter/material.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({super.key, required this.title, this.backButton = false});
  final String title;
  final bool backButton;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      automaticallyImplyLeading: backButton,
      actions: [
        const TextButton(
          onPressed: AppNavigation.toHome,
          child: Text(AppLocalization.mainTitle, style: AppTextStyles.mainStyle),
        ),
        TextButton(
          onPressed: () {},
          child: const Text(AppLocalization.aboutUsTitle, style: AppTextStyles.mainStyle),
        ),
        const TextButton(
          onPressed: AppNavigation.toCatalog,
          child: Text(AppLocalization.catalogTitle, style: AppTextStyles.mainStyle),
        ),
        TextButton(
          onPressed: () {},
          child: const Text(AppLocalization.contactUsTitle, style: AppTextStyles.mainStyle),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

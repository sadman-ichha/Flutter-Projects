import 'package:flutter/material.dart';
import 'package:seu_cover_page/utils/constant.dart';
import 'package:seu_cover_page/utils/helpers/helper_functions.dart';
import 'package:seu_cover_page/utils/themes/app_colors.dart';

class AppSectionDivider extends StatelessWidget {
  const AppSectionDivider({
    super.key,
    required this.dividerText,
  });

  final String dividerText;

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Divider(
            color: dark ? AppColors.darkGrey : AppColors.grey,
            thickness: 0.5,
            indent: 60,
            endIndent: 5,
          ),
        ),
        Text(
          dividerText,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        Flexible(
          child: Divider(
            color: dark ? AppColors.darkGrey : AppColors.grey,
            thickness: 0.5,
            indent: 5,
            endIndent: 60,
            height: AppSizes.dividerHeight,
          ),
        ),
      ],
    );
  }
}

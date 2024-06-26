import 'package:flutter/material.dart';
import 'package:seu_cover_page/utils/helpers/helper_functions.dart';
import 'package:seu_cover_page/utils/responsive_text.dart';
import 'package:seu_cover_page/utils/themes/app_colors.dart';
import 'package:seu_cover_page/utils/themes/app_images.dart';
import '../utils/screen_size.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppHelperFunctions.isDarkMode(context)
          ? AppColors.dark
          : Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // SizedBox(height: ScreenSize.screenSize.height / 3),
            Center(
              child: Image.asset(
                AppImages.seuLogo,
                width: ScreenSize.screenSize.width * 0.3,
              ),
            ),
            SizedBox(height: ScreenSize.screenSize.height * 0.03),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: LinearProgressIndicator(color: AppColors.primary),
            ),
            SizedBox(height: ScreenSize.screenSize.height * 0.02),
            // Using ResponsiveText widget
            const ResponsiveText(
              text: "SEU Cover Page Generator",
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
              scale: 0.04, // Adjust the scale factor as needed
            ),
          ],
        ),
      ),
    );
  }
}

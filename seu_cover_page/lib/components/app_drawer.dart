import 'package:flutter/material.dart';
import 'package:seu_cover_page/components/url_launcher.dart';
import 'package:seu_cover_page/utils/responsive_text.dart';
import 'package:seu_cover_page/utils/screen_size.dart';
import 'package:seu_cover_page/utils/themes/app_images.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenSize.screenSize.height / 1.9,
      width: ScreenSize.screenSize.width / 1.3,
      decoration: BoxDecoration(
        color: Colors.amberAccent.withOpacity(.8),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            SizedBox(height: ScreenSize.screenSize.height * 0.03),
            const Center(
              child: CircleAvatar(
                radius: 38.0,
                backgroundColor: Colors.blue,
                child: CircleAvatar(
                  radius: 34.0,
                  backgroundImage: AssetImage(AppImages.profilepic),
                ),
              ),
            ),
            const Text(
              "Sadman Ichha",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 26.0),
            ),
            SizedBox(height: ScreenSize.screenSize.height * 0.01),
            const ResponsiveText(
                text:
                    "Empower your academic journey with the SEU Assignment & Lab Report Cover Page Generator app. Streamline your document creation process by effortlessly generating professional cover pages for your assignments and lab reports. With user-friendly features and customizable templates. I Strive to continuously inprove the application."),
            SizedBox(height: ScreenSize.screenSize.height * 0.03),
            Row(
              children: [
                InkWell(
                  onTap: () => launchUrl('mailto:sadmanichha@gmail.com'),
                  child: const Icon(Icons.mail, size: 30.0),
                ),
                const SizedBox(width: 20.0),
                InkWell(
                  onTap: () =>
                      launchUrl("https://www.linkedin.com/in/sadman-ichha/"),
                  child: const CircleAvatar(
                    backgroundImage: AssetImage(AppImages.linkedIn),
                    radius: 15.0,
                  ),
                ),
                const SizedBox(width: 20.0),
                InkWell(
                  onTap: () => launchUrl("https://github.com/sadman-ichha"),
                  child: const CircleAvatar(
                    backgroundImage: AssetImage(AppImages.github),
                    radius: 15.0,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

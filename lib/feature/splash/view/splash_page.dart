import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:smart_courier_assistant_app/ui/app_colors.dart';
import 'package:smart_courier_assistant_app/ui/app_text_styles.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterSplashScreen(
      useImmersiveMode: true,
      duration: const Duration(milliseconds: 2000),
      splashScreenBody: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: AlignmentGeometry.topCenter,
            end: AlignmentGeometry.bottomCenter,
            colors: [
              AppColors.blue,
              AppColors.syan,
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.local_shipping_outlined,
                size: 100,
                color: Colors.white,
              ),
              Text(
                'Smart Courier Assistant',
                style: AppTextStyles.splashTextStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

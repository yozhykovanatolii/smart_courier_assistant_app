import 'package:flutter/material.dart';
import 'package:smart_courier_assistant_app/gen/fonts.gen.dart';
import 'package:smart_courier_assistant_app/ui/app_colors.dart';
import 'package:smart_courier_assistant_app/ui/widgets/arrow_back_button.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.only(
            top: 30,
            left: 24,
            right: 24,
          ),
          children: [
            const Align(
              alignment: AlignmentGeometry.centerStart,
              child: ArrowBackButton(),
            ),
            const SizedBox(height: 20),
            const Text(
              'Sign up',
              style: TextStyle(
                color: AppColors.black,
                fontSize: 32,
                fontWeight: FontWeight.w700,
                fontFamily: FontFamily.inter,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Create an account to continue!',
              textAlign: TextAlign.start,
              style: TextStyle(
                color: AppColors.grey,
                fontSize: 12,
                fontWeight: FontWeight.w500,
                fontFamily: FontFamily.inter,
              ),
            ),
            const SizedBox(height: 45),
            const Text(
              'Full name',
              textAlign: TextAlign.start,
              style: TextStyle(
                color: AppColors.grey,
                fontSize: 12,
                fontWeight: FontWeight.w500,
                fontFamily: FontFamily.plusJakartaSans,
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              'Email',
              textAlign: TextAlign.start,
              style: TextStyle(
                color: AppColors.grey,
                fontSize: 12,
                fontWeight: FontWeight.w500,
                fontFamily: FontFamily.plusJakartaSans,
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              'Password',
              textAlign: TextAlign.start,
              style: TextStyle(
                color: AppColors.grey,
                fontSize: 12,
                fontWeight: FontWeight.w500,
                fontFamily: FontFamily.plusJakartaSans,
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              'Phone number',
              textAlign: TextAlign.start,
              style: TextStyle(
                color: AppColors.grey,
                fontSize: 12,
                fontWeight: FontWeight.w500,
                fontFamily: FontFamily.plusJakartaSans,
              ),
            ),
            const SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}

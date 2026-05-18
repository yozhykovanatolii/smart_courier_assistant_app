import 'package:flutter/material.dart';
import 'package:smart_courier_assistant_app/feature/login/widgets/widgets.dart';
import 'package:smart_courier_assistant_app/gen/fonts.gen.dart';
import 'package:smart_courier_assistant_app/ui/app_colors.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.only(
            top: 45,
            left: 24,
            right: 24,
          ),
          children: [
            const Text(
              'Sign in to your Account',
              textAlign: TextAlign.start,
              style: TextStyle(
                color: AppColors.black,
                fontSize: 32,
                fontWeight: FontWeight.w700,
                fontFamily: FontFamily.inter,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Enter your email and password to log in',
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
            const LoginEmailField(),
            const SizedBox(height: 25),
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
            const LoginPasswordField(),
            const SizedBox(height: 20),
            const Align(
              alignment: AlignmentGeometry.centerEnd,
              child: ForgotPasswordTextButton(),
            ),
            const SizedBox(height: 20),
            const LogInButton(),
            const SizedBox(height: 30),
            const LoginDivider(),
            const SizedBox(height: 30),
            const LogInWithGoogle(),
            const SizedBox(height: 110),
            const Align(
              alignment: AlignmentGeometry.bottomCenter,
              child: HaveNotAccountSection(),
            ),
          ],
        ),
      ),
    );
  }
}

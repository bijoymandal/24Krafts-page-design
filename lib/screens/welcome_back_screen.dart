import 'package:crafts/core/utils/app_notifications.dart';
import 'package:crafts/screens/otp_verification_screen.dart';
import 'package:flutter/foundation.dart'; // ← Add this import
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_state.dart';
import '../widgets/welcome_illustration.dart';
import '../widgets/role_chip.dart';
import '../widgets/phone_input.dart';
import '../widgets/send_otp_button.dart';
import '../widgets/sign_up_footer.dart';

class WelcomeBackScreen extends StatelessWidget {
  const WelcomeBackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthBloc(),
      child: BlocListener<AuthBloc, AuthState>(
        listenWhen: (previous, current) =>
            current.otpSent != previous.otpSent ||
            current.errorMessage != previous.errorMessage,

        listener: (context, state) {
          // === ERROR ===
          if (state.errorMessage?.isNotEmpty == true) {
            AppNotifications.showError(context, state.errorMessage!);
            return;
          }

          // === SUCCESS - OTP SENT ===
          if (state.otpSent && state.phoneNumber.isNotEmpty) {
            // Build success message
            String message = "OTP sent successfully!";

            // Only show actual OTP in debug mode (for testing)
            if (kDebugMode && state.lastSentOtp?.isNotEmpty == true) {
              message =
                  "OTP: ${state.lastSentOtp!}  (sent to ${state.phoneNumber})";
            }

            AppNotifications.showSuccess(context, message);

            // Navigate after user sees the OTP (especially useful in debug)
            Future.delayed(const Duration(milliseconds: 1500), () {
              if (!context.mounted) return;

              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (_) =>
                      OtpVerificationScreen(number: state.phoneNumber),
                ),
                (route) => false,
              );
            });
          }
        },

        child: Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: const [
                  SizedBox(height: 20),
                  WelcomeIllustration(),
                  SizedBox(height: 32),
                  _TitleSection(),
                  SizedBox(height: 40),
                  RoleSelector(),
                  SizedBox(height: 40),
                  PhoneInput(),
                  SizedBox(height: 20),
                  SendOtpButton(),
                  SizedBox(height: 10),
                  SignUpFooter(),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _TitleSection extends StatelessWidget {
  const _TitleSection();

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text(
          'Welcome Back',
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Text(
          'Enter your mobile number to continue',
          style: TextStyle(fontSize: 16, color: Colors.black54),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class RoleSelector extends StatelessWidget {
  const RoleSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RoleChip(
              icon: Icons.palette,
              label: 'Artist',
              isSelected: state.selectedRole == AuthRole.artist,
              onTap: () => context.read<AuthBloc>().selectRole(AuthRole.artist),
            ),
            const SizedBox(width: 48),
            RoleChip(
              icon: Icons.work_outline,
              label: 'Recruiter',
              isSelected: state.selectedRole == AuthRole.recruiter,
              onTap: () =>
                  context.read<AuthBloc>().selectRole(AuthRole.recruiter),
            ),
          ],
        );
      },
    );
  }
}

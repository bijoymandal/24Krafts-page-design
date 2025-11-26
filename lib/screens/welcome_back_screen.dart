import 'package:crafts/screens/otp_verification_screen.dart';
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
        listenWhen: (previous, current) => current.otpSent && !previous.otpSent,
        listener: (context, state) {
          // This runs ONLY when Send OTP is clicked
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) =>
                  OtpVerificationScreen(phoneNumber: state.phoneNumber),
            ),
          );
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

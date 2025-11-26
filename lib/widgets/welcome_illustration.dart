import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_state.dart';

class WelcomeIllustration extends StatelessWidget {
  const WelcomeIllustration({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        final isArtist = state.selectedRole == AuthRole.artist;

        return AnimatedContainer(
          duration: const Duration(milliseconds: 700),
          curve: Curves.easeInOut,
          height: 280,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.vertical(
              bottom: Radius.circular(32),
            ),
            gradient: LinearGradient(
              colors: isArtist
                  ? [const Color(0xFF8E24AA), const Color(0xFF6A1B9A)]
                  : [const Color(0xFF1E88E5), const Color(0xFF42A5F5)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.vertical(
              bottom: Radius.circular(32),
            ),
            child: AnimatedCrossFade(
              duration: const Duration(milliseconds: 800),
              crossFadeState: isArtist
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              firstChild: Image.asset(
                'assets/images/welcome_screen.png',
                fit: BoxFit.cover,
                width: double.infinity,
              ),
              secondChild: Image.asset(
                'assets/images/screen_part_2.png',
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
        ).animate().shimmer(duration: 3000.ms);
      },
    );
  }
}

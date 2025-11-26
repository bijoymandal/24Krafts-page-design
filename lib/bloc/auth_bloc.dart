import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_state.dart';

class AuthBloc extends Cubit<AuthState> {
  AuthBloc()
    : super(AuthState(selectedRole: AuthRole.artist)); // ARTIST DEFAULT

  void selectRole(AuthRole role) => emit(state.copyWith(selectedRole: role));

  void updatePhoneNumber(String number) =>
      emit(state.copyWith(phoneNumber: number.trim()));

  void sendOtp() async {
    if (state.phoneNumber.length < 10 || state.selectedRole == null) return;

    emit(state.copyWith(isLoading: true));
    await Future.delayed(const Duration(seconds: 2));

    emit(state.copyWith(isLoading: false, otpSent: true));
  }

  void resetOtpSent() => emit(state.copyWith(otpSent: false));
}

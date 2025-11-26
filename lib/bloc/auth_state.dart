enum AuthRole { artist, recruiter }

class AuthState {
  final AuthRole? selectedRole;
  final String phoneNumber;
  final bool isLoading;
  final bool otpSent;

  AuthState({
    this.selectedRole,
    this.phoneNumber = '',
    this.isLoading = false,
    this.otpSent = false,
  });

  AuthState copyWith({
    AuthRole? selectedRole,
    String? phoneNumber,
    bool? isLoading,
    bool? otpSent,
  }) {
    return AuthState(
      selectedRole: selectedRole ?? this.selectedRole,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      isLoading: isLoading ?? this.isLoading,
      otpSent: otpSent ?? this.otpSent,
    );
  }
}

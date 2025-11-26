import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileState {
  final String? gender;
  final String? department;

  ProfileState({this.gender, this.department});

  ProfileState copyWith({String? gender, String? department}) {
    return ProfileState(
      gender: gender ?? this.gender,
      department: department ?? this.department,
    );
  }
}

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileState());

  void setGender(String? value) => emit(state.copyWith(gender: value));
  void setDepartment(String? value) => emit(state.copyWith(department: value));
}

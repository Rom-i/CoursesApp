import 'package:courses_app/core/routing/routes.dart';
import 'package:courses_app/features/profile/data/repo/profile_repo.dart';
import 'package:courses_app/features/profile/presentation/cubit/profile_cubit/profile_state.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepo _profileRepo;
  ProfileCubit(this._profileRepo) : super(ProfileState());

  Future<void> getProfile() async {
    emit(ProfileState(status: ProfileStatus.loading));
    final res = await _profileRepo.getProfile();
    res.fold(
      (l) => emit(ProfileState(status: ProfileStatus.error, error: l)),
      (r) => emit(ProfileState(status: ProfileStatus.success, user: r)),
    );
  }

  Future<void> logout(BuildContext context) async {
    emit(ProfileState(status: ProfileStatus.loading));
    Navigator.pushNamedAndRemoveUntil(
      context,
      AppRoutes.loginscreen,
      (route) => false,
    );
    final res = await _profileRepo.logout();
    res.fold(
      (error) => emit(ProfileState(status: ProfileStatus.error, error: error)),
      (_) {
        emit(ProfileState(status: ProfileStatus.logout));
      },
    );
  }
}
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/Featuers/user_info/data/user_info_model.dart';
import 'package:newsapp/Featuers/user_info/persentation/save_info_cubit/profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  Future<void> saveUserInfo({
    required String name,
    required String email,
    required String bio,
    required String profilePic,
  }) async {
    try {
      emit(ProfileLoading());

      // Create the user info model
      UserInfoModel userInfo = UserInfoModel(
        name: name,
        email: email,
        bio: bio,
        profilePic: profilePic,
        createdAt: DateTime.now().toIso8601String(),
        phoneNumber: '1234567890', // Example phone number
        uid: 'userUid', // Replace with actual UID
      );

      // Save to Firestore
      await FirebaseFirestore.instance
          .collection('users')
          .doc(
            userInfo.uid,
          )
          .set(userInfo.toMap());

      emit(ProfileSuccess());
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }
}

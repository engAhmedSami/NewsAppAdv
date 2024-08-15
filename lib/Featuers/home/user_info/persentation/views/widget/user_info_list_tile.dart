import 'dart:io';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:newsapp/Featuers/home/user_info/data/user_info_model.dart';
import 'package:newsapp/Featuers/home/user_info/persentation/views/widget/edit_profile_body.dart';

class UserInfoListTile extends StatefulWidget {
  final String uid;

  const UserInfoListTile({super.key, required this.uid});

  @override
  UserInfoListTileState createState() => UserInfoListTileState();
}

class UserInfoListTileState extends State<UserInfoListTile> {
  late Future<UserInfoModel> _userInfoFuture;

  @override
  void initState() {
    super.initState();
    _userInfoFuture = fetchUserInfo();
  }

  Future<UserInfoModel> fetchUserInfo() async {
    final docSnapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(widget.uid)
        .get();

    if (docSnapshot.exists) {
      return UserInfoModel.fromMap(docSnapshot.data()!);
    } else {
      throw Exception("User data not found");
    }
  }

  void _updateUserInfo() {
    setState(() {
      _userInfoFuture =
          fetchUserInfo(); // Reload user info when data is updated
    });
  }

  Future<String?> _uploadImageToFirebase(String filePath) async {
    try {
      final storageRef = FirebaseStorage.instance.ref();
      final file = File(filePath);
      final fileName = file.uri.pathSegments.last;
      final imageRef = storageRef.child("profile_pics/$fileName");
      final uploadTask = imageRef.putFile(file);
      final snapshot = await uploadTask.whenComplete(() => null);
      final downloadUrl = await snapshot.ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      // Handle any errors during the upload process
      debugPrint("Error uploading image: $e");
      return null;
    }
  }

  Future<void> _updateProfilePicUrlInFirestore(
      String uid, String downloadUrl) async {
    await FirebaseFirestore.instance.collection('users').doc(uid).update({
      'profilePic': downloadUrl,
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<UserInfoModel>(
      future: _userInfoFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const ListTile(
            title: Text("Error loading user data"),
          );
        } else if (!snapshot.hasData) {
          return const ListTile(
            title: Text("User data not found"),
          );
        } else {
          // Data is loaded
          final userInfoModel = snapshot.data!;
          String profilePicUrl = userInfoModel.profilePic ?? '';

          if (profilePicUrl.isEmpty) {
            profilePicUrl =
                'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png';
          } else if (profilePicUrl.startsWith('/')) {
            // If the profilePic is a local file path, try to upload it to Firebase Storage
            _uploadImageToFirebase(profilePicUrl).then((downloadUrl) {
              if (downloadUrl != null) {
                // Update Firestore with the new URL
                _updateProfilePicUrlInFirestore(widget.uid, downloadUrl);
                // Update the profilePicUrl to the download URL for display
                profilePicUrl = downloadUrl;
              }
            });
          }

          return ListTile(
            leading: profilePicUrl.startsWith('/')
                ? CircleAvatar(
                    backgroundImage: FileImage(File(profilePicUrl)),
                    radius: 30,
                  )
                : CircleAvatar(
                    backgroundImage: NetworkImage(profilePicUrl),
                    radius: 30,
                  ),
            title: Text(userInfoModel.name ?? ''),
            subtitle: Text(userInfoModel.bio ?? ''),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return EditUserInfoView(
                    uid: widget.uid,
                    userInfo: userInfoModel,
                    onUserInfoUpdated: _updateUserInfo,
                  );
                },
              ));
            },
          );
        }
      },
    );
  }
}

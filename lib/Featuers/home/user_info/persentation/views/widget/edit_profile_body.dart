// ignore_for_file: use_build_context_synchronously

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:newsapp/Core/widget/custom_botton.dart';
import 'package:newsapp/Core/widget/custom_text_field.dart';
import 'package:newsapp/Featuers/auth/presentation/view/verfied_email_view.dart';
import 'package:newsapp/Featuers/home/user_info/data/user_info_model.dart';

class EditUserInfoView extends StatefulWidget {
  final String uid;
  final UserInfoModel userInfo;

  const EditUserInfoView({
    super.key,
    required this.uid,
    required this.userInfo,
    required Null Function() onUserInfoUpdated,
  });

  @override
  EditUserInfoViewState createState() => EditUserInfoViewState();
}

class EditUserInfoViewState extends State<EditUserInfoView> {
  late TextEditingController nameController;
  late TextEditingController bioController;
  File? profileImage;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.userInfo.name);
    bioController = TextEditingController(text: widget.userInfo.bio);
  }

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        profileImage = File(pickedFile.path);
      });
    }
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
      debugPrint("Error uploading image: $e");
      return null;
    }
  }

  Future<void> _updateUserInfo() async {
    String? profilePicUrl = widget.userInfo.profilePic;

    if (profileImage != null) {
      profilePicUrl = await _uploadImageToFirebase(profileImage!.path);
    }

    final updatedUserInfo = {
      'name': nameController.text,
      'bio': bioController.text,
      'profilePic': profilePicUrl,
    };

    await FirebaseFirestore.instance
        .collection('users')
        .doc(widget.uid)
        .update(updatedUserInfo);

    if (context.mounted) {
      Navigator.of(context).pop(true); // Notify parent widget of the update
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBarC(
        title: 'Edit Profile',
        context,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 24),
            GestureDetector(
              onTap: _pickImage,
              child: CircleAvatar(
                radius: 50,
                backgroundImage: profileImage != null
                    ? FileImage(profileImage!)
                    : NetworkImage(widget.userInfo.profilePic ?? ''),
              ),
            ),
            const SizedBox(height: 24),
            CustomTextFormField(
              hintText: 'Name',
              controller: nameController,
              prefixIcon: const Icon(Icons.person, color: Colors.grey),
              textInputType: TextInputType.name,
            ),
            const SizedBox(height: 24.0),
            CustomTextFormField(
              hintText: 'Bio',
              controller: bioController,
              prefixIcon: const Icon(Icons.info, color: Colors.grey),
              textInputType: TextInputType.name,
            ),
            const SizedBox(height: 24),
            CustomBotton(
              text: 'Update',
              onPressed: _updateUserInfo,
            ),
          ],
        ),
      ),
    );
  }
}

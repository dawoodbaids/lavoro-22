// ignore_for_file: avoid_print

//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

import '../../../core/utils/helpers/custom_snack_bar.dart';
import '../../../core/utils/helpers/system_helper.dart';
import '../../../data/model/user_model.dart';
import '../../../data/provider/firebase_image.dart';
import '../../../data/provider/user_firebase.dart';
import '../../../routes/app_pages.dart';

class RegisterControllerCompany extends GetxController {
  final formKey = GlobalKey<FormState>();
  RxBool isLoading = false.obs;
 //final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late User? user;
  late String selectedCountry2 = "Select Country";
  late RxBool isExpanded = false.obs;
    late String experience;
late  String? imagePath;
  late String country;
  late TextEditingController companyNameController;
  late TextEditingController cemailController;
  late TextEditingController jobDescriptionController;
  late TextEditingController cphoneController;
  late TextEditingController cpasswordController;
  late TextEditingController cconfirmPasswordController;
  late RxList<String> cselectedLanguages = <String>[].obs;

 late String selectedExperience= "select experience";
 List<String> experiences= [
    "select experience",
    "0-Experince",
    "1-5 years",
    "5-10  years",
    "10-15",
"15 OR more",

  ];
  List<String> countries = [
    "Select Country",
    "irbid",
    "aqaba",
    "zarqa",
    "amman",
    "ma'an",
    "balqa",
    "maraq",
    "tafilah",
    "madaba",
    "jerash",
    "ajloun",
    "karak"
  ];

 Map<String, List<String>> jobLanguages = {
  'Front-end Engineer': ['HTML', 'CSS', 'JavaScript'],
  'Mobile App Developer': ['Dart', 'Swift', 'Kotlin'],
  'Accessibility Specialist': ['HTML', 'CSS', 'JavaScript'],
  'Ruby on Rails Developer': ['Ruby', 'Rails'],
  'PHP Developer': ['PHP'],
  'Server-side Engineer': ['Node.js', 'Python', 'Java', 'C#'],
  'Big Data Engineer': ['Hadoop', 'Spark', 'SQL'],
  'Data Warehouse Architect': ['SQL', 'Data Modeling'],
  'Cybersecurity Specialist': ['Python', 'C/C++', 'Java'],
  'IT Support Specialist': ['Scripting Languages', 'Troubleshooting'],
  'Quality Assurance (QA) Engineer': ['Scripting Languages', 'Testing Frameworks'],
  'DevOps Engineer': ['Python', 'Bash', 'PowerShell'],
  'Cloud Architect/Engineer': ['Python', 'PowerShell'],
  'Machine Learning Engineer': ['Python', 'TensorFlow', 'PyTorch'],
  'Blockchain Developer': ['Solidity', 'Go', 'JavaScript'],
  'IoT Specialist': ['C/C++', 'Python', 'JavaScript'],
  'UI/UX Designer': ['Figma', 'Sketch', 'Adobe XD'],
  'Data Scientist': ['Python', 'R', 'SQL'],
  'AI Ethics Specialist': ['AI/ML Development Languages'],
};


  @override
  void onInit() {
    cemailController = TextEditingController();
    cpasswordController = TextEditingController();
    cconfirmPasswordController = TextEditingController();
    companyNameController = TextEditingController();
    jobDescriptionController = TextEditingController();
    cphoneController = TextEditingController();
    country = countries[0];
    cselectedLanguages = <String>[].obs;
  experience = experiences[0];
    super.onInit();
  }

  Future<void> signUp() async {
    if (passwordConfirmed()) {
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: cemailController.text.trim(),
          password: cpasswordController.text.trim(),
        );
        await onContinuePressed();

        Get.offAllNamed(Routes.HOME);
      } catch (e) {
        print('Error during sign up: $e');
        CustomSnackBar.error(message: e.toString());
      }
    } else {
      print('Passwords do not match');
      // Handle passwords not matching, e.g., show an error.
    }
  }

  bool passwordConfirmed() {
    return cpasswordController.text.trim() ==
        cconfirmPasswordController.text.trim();
  }

  Future<void> onContinuePressed() async {
    SystemHelper.closeKeyboard();
    final isValidForm = formKey.currentState!.validate();
    if (isValidForm == false) return;
    if (imagePath == null || imagePath!.isEmpty) {
      CustomSnackBar.warning(
        title: "Profile picture",
        message: "Please select a profile picture",
      );
      return;
    }

    isLoading(true);

    try {
      var uuid = const Uuid();
      var v1 = uuid.v1();

      final imageUrl = await FirebaseImage.uploadUserImage(
        imagePath: imagePath!,
        uid: v1,
      );

      UserAccount userAccount = UserAccount(
        uid: v1,
        username: companyNameController.text,
        imageUrl: imageUrl!,
        phoneNumber: cphoneController.text,
        descrption: jobDescriptionController.text,
        email: cemailController.text,
        country: selectedCountry2,
        selectedLanguages: cselectedLanguages,
       experience:selectedExperience,
      );

      await DatabaseFirestore.setUser(userAccount: userAccount);

      UserAccount.currentUser = userAccount;

      Get.offAllNamed(Routes.HOME);
    } catch (e) {
      CustomSnackBar.error(message: e.toString());
    }

    isLoading(false);
  }

  //Future<UserAccount?> getUser() async {
    // try {
     // final paths =
     //     await _firestore.collection("users").doc(userInfo?.uid).get();
     // Map<String, dynamic> data = paths.data() ?? {};
//
     // if (!completer.isCompleted) {
     //   completer.complete(UserAccount.formJson(data));
      }
      // } on FirebaseException catch (e) {
      //   if (!completer.isCompleted) {qضq
      //     showDialog(
      //       context: Get.overlayContext!,
      //       builder: (BuildContext context) {
      //         return AlertDialog(
      //           title: Text('Firebase Exception'),
      //           content: Text(e.message.toString()),
      //         );
      //       },
      //     );
      //   }
  //  } catch (e) {
     // if (!completer.isCompleted) {
   //     print('salah ');
        //Get.offAll(() => const NoInternetView());
  ///  /  }
    //}

   // return completer.future;
 /// }
 // }
 //  static User? get userInfo {
   // return FirebaseAuth.instance.currentUser;
// // }
//}

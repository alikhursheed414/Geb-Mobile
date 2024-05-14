import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../CustomBottom_Bar.dart';
import '../Views/Authentication/login.dart';
import '../Widgets/ShareedPreferences.dart';


class AuthController extends GetxController{
  var fullnameController=TextEditingController();
  var emailController=TextEditingController();
  var phoneController=TextEditingController();

  var passController=TextEditingController();
  var ConfirmPassController=TextEditingController();

  var isLoading = false.obs;

  var obscuretext=false.obs;



  void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black54,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  // Future<void> isUserAlreadyLoggedIn()async{
  //   UserCredential userCredential;
  //   await FirebaseAuth.instance.authStateChanges().listen((User? user) async{
  //     if(user != null){
  //
  //       var data= await FirebaseFirestore.instance.collection('doctors').doc(user.uid).get();
  //       var isData= data.data()?.containsKey('docName') ?? false;
  //
  //       if(isData){
  //         //Get.offAll(()=>BookAppointmentsList(isDoctor: true,));
  //       }
  //       else{
  //         //Get.offAll(()=>HomeBottomBar());
  //       }
  //
  //     }else{
  //       //Get.offAll(()=>HomePage());
  //     }
  //   });
  // }

  Future<void> signInWithEmailAndPassword() async {
    try {
      final UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passController.text.trim(),
      );

      MySharedPreferences.setLoggedIn(true);

      Get.offAll(()=>HomeBottomBar());
    }  on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showToast('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        showToast('Wrong password provided for that user.');
      } else {
        showToast(e.message ?? 'Login failed.');
      }
    } catch (e) {
      showToast('Login failed.');
    }
  }


  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<User?> signInWithGoogle() async {
    try {
      // Trigger the Google Sign In flow
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      if (googleUser == null) {
        print("No Google user returned.");
        return null;
      }

      // Obtain the GoogleSignInAuthentication object
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      // Create a new credential
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Sign in to Firebase with the Google credential
      final UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
      final User? user = userCredential.user;

      if (user == null) {
        print("No Firebase user returned after Google sign-in.");
        return null;
      }

      // Query Firestore to see if user already exists based on email
      final QuerySnapshot existingUserSnapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('userEmail', isEqualTo: googleUser.email)
          .limit(1)
          .get();

      if (existingUserSnapshot.docs.isEmpty) {
        // No user exists, add new user data
        print("No existing user found, adding new user data.");
        await FirebaseFirestore.instance.collection('users').add({
          'userId': user.uid,
          'userName': googleUser.displayName,
          'userEmail': googleUser.email,
          'imageUrl': googleUser.photoUrl,
          'phoneNumber': "121212",
          'createdOn': FieldValue.serverTimestamp(),
          'userRate': "\$40.00",
          // Add more fields as needed
        });
      } else {
        print("Existing user found, skipping data addition.");
      }

      // Update user profile data
      User updateUser = FirebaseAuth.instance.currentUser!;
      updateUser.updateDisplayName(googleUser.displayName);
      updateUser.updatePhotoURL(googleUser.photoUrl);

      MySharedPreferences.setLoggedIn(true);

      Get.offAll(() => HomeBottomBar());
      return updateUser;

    } catch (error) {
      print('Google sign-in error: $error');
      return null;
    }
  }

  Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      await googleSignIn.signOut();
      Get.offAll(()=>LoginScreen());
    } catch (e) {
      showToast('Failed to sign out: $e');
    }
  }

  ///

  Future<void> register() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passController.text.trim(),
      );

      // Get current user
      User? user = FirebaseAuth.instance.currentUser;

      // Get a Firestore instance
      FirebaseFirestore firestore = FirebaseFirestore.instance;

      // Add a new document with auto-generated ID
      await firestore.collection('users').add({
        'userId': user?.uid,
        'userName': fullnameController.text,
        'userEmail': emailController.text,
        'phoneNumber': phoneController.text,
        'imageUrl': "",
        'userRate':"\$40.00",
        'createdOn': FieldValue.serverTimestamp(),
      });

      showToast("User registered Successfully!");

      emailController.clear();
      fullnameController.clear();
      phoneController.clear();
      passController.clear();
      ConfirmPassController.clear();

      Get.back();

    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        showToast('The account already exists for that email.');
      } else {
        showToast(e.message ?? 'Registration failed.');
      }
    } catch (e) {
      showToast('Registration failed.');
    }
  }



  ///


}
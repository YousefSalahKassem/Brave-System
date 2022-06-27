import 'package:bravesystem/utils/routes.dart';
import 'package:bravesystem/view/Authentication/login_screen.dart';
import 'package:bravesystem/view/LandingPage/landing_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../model/ServiceModel/user_model.dart';
import '../service/firestore_user.dart';

class AuthController extends GetxController{
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String errorMessage = "";

  TextEditingController email=TextEditingController();
  TextEditingController name=TextEditingController();
  TextEditingController phone=TextEditingController();
  TextEditingController password=TextEditingController();

  bool _isLoadingSignInWithGoogle = false;
  bool get isLoadingSignInWithGoogle => _isLoadingSignInWithGoogle;
  bool isLoadingSignIn = false;
  bool isLoadingCreateAccount = false;


  Future<UserModel?> googleSignInMethod() async {
    UserModel? userModel;
    _isLoadingSignInWithGoogle = true;
    // sign in with google

    await _googleSignIn.signIn().then((value) async {
      GoogleSignInAuthentication googleSignInAuthentication =
      await value!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);
      await _auth.signInWithCredential(credential).then((usercredential) {
        userModel = UserModel(
            email: usercredential.user?.email,
            name: usercredential.user?.displayName,
            picture: usercredential.user?.photoURL,
            userId: usercredential.user?.uid);
        _isLoadingSignInWithGoogle = false;

        GetSnackBar(
          title: 'Welcome ${usercredential.user?.displayName}',
          backgroundColor: Colors.green,
          snackPosition: SnackPosition.BOTTOM,
        );
        AppRoute.pushReplacement(const LandingPage(),name: 'landingPage');

        update();

        saveUserToFireStore(userModel!);

      });
    }).catchError((error) {
      _isLoadingSignInWithGoogle = false;
      errorMessage = error.toString();
      print(errorMessage);
      GetSnackBar(
        title: errorMessage,
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.BOTTOM,
      );
      update();
    });

    return userModel;
  }

  Future<UserModel?> signInWithEmailAndPassword() async {
    UserModel? userModel;
    isLoadingSignIn = true;
    update();
    try {
      await _auth
          .signInWithEmailAndPassword(email: email.text, password: password.text)
          .then((value) async {
        isLoadingSignIn = false;
        const GetSnackBar(
          title: 'Welcome Back !',
          backgroundColor: Colors.green,
          snackPosition: SnackPosition.BOTTOM,
        );
        AppRoute.pushReplacement(const LandingPage(),name: 'landingPage');
        print(value.user!.uid);
        update();
        // _getCurrentUser(user.user.uid);
      }); // .then((value) => print(value));
      //Get.offAll(() => EcommerceLayout(), binding: HomeViewBinding());
    } catch (e) {
      isLoadingSignIn = false;
      errorMessage = e.toString();
      print(errorMessage);
      const GetSnackBar(
        title: 'something Wrong, Please Try again !',
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.BOTTOM,
      );

      update();

    }
    return userModel;
  }

  Future<UserModel?> createAccount() async {
    UserModel? userModel;
    isLoadingCreateAccount = true;
    update();
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email.text, password: password.text)
          .then((userCredential) {
        userModel = UserModel(
            email: email.text,
            name: name.text,
            picture: '',
            phone: phone.text,
            userId: userCredential.user?.uid);
        isLoadingCreateAccount = false;
        update();
        saveUserToFireStore(userModel!);

        GetSnackBar(
          title: 'Welcome ${name.text}',
          backgroundColor: Colors.green,
          snackPosition: SnackPosition.BOTTOM,
        );
          }); // .then((value) => print(value));
      // Get.offAll(() => EcommerceLayout(), binding: HomeViewBinding());
    } catch (e) {
      errorMessage = e.toString();
      isLoadingCreateAccount = false;
      GetSnackBar(
        title: errorMessage,
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.BOTTOM,
      );
      update();
    }
    return userModel;
  }

  saveUserToFireStore(UserModel user) async {
    await FireStoreUser().addUserToFireStore(user);
  }

  Future resetPassword(String email) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }



  signOut() async {
    GoogleSignIn().signOut();
    await FirebaseAuth.instance.signOut();
    AppRoute.pushReplacement(LoginScreen(),name: 'login');
  }

}
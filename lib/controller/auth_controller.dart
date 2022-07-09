import 'package:bravesystem/constants/dimensions.dart';
import 'package:bravesystem/utils/routes.dart';
import 'package:bravesystem/view/Authentication/login_screen.dart';
import 'package:bravesystem/view/LandingPage/landing_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../components/text_field.dart';
import '../constants/color.dart';
import '../model/ServiceModel/user_model.dart';
import '../service/firestore_user.dart';
import 'package:country_code_picker/country_code_picker.dart';

class AuthController extends GetxController{
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  final FirebaseAuth _auth = FirebaseAuth.instance;

  UserModel? userModel;

  String errorMessage = "";
  String verificationId ='';
  String countryCode='';

  Rxn<List<UserModel>> user=Rxn<List<UserModel>>();
  List<UserModel>? get users=> user.value;

  TextEditingController email=TextEditingController();
  TextEditingController name=TextEditingController();
  TextEditingController phone=TextEditingController();
  TextEditingController password=TextEditingController();
  TextEditingController otp=TextEditingController();

  bool _isLoadingSignInWithGoogle = false;
  bool get isLoadingSignInWithGoogle => _isLoadingSignInWithGoogle;
  bool isLoadingSignIn = false;
  bool isLoadingCreateAccount = false;
  bool otpVisibility = false;

  @override
  void onInit() {
    user.bindStream(getcurrentUser());
    super.onInit();
  }

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

  loginWithPhoneSheet(BuildContext context){
    return showModalBottomSheet(
        context: context,
        builder: (context){
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: Wrap(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Center(child: Text('Login with Phone', style: TextStyle(color: ColorsApp().primary,fontWeight: FontWeight.bold,fontSize: 20),)),
                ),
                SizedBox(height: Dimensions.height20,),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text('Phone', style: TextStyle(color: ColorsApp().primary,fontWeight: FontWeight.bold,fontSize: 14),),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: ColorsApp().primary,
                      width: 2
                    ),
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width:Dimensions.height30*4,
                        child: CountryCodePicker(
                          initialSelection: 'EG',
                          showCountryOnly: false,
                          showOnlyCountryWhenClosed: false,
                          favorite: const ['+20','EG'],
                          enabled: true,
                          hideMainText: false,
                          showFlagMain: true,
                          showFlag: true,
                          hideSearch: false,
                          showFlagDialog: true,
                          alignLeft: true,
                          onChanged: (value){
                            countryCode=value.toString();
                          },
                        ),
                      ),
                      Expanded(
                        child: TextFormField(
                          controller: phone,
                          style: TextStyle(color: ColorsApp().dark,fontWeight: FontWeight.bold),
                          keyboardType: TextInputType.phone,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                          ),

                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: Dimensions.height20*1.5,),
                otpVisibility?Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: Text('OTP', style: TextStyle(color: ColorsApp().primary,fontWeight: FontWeight.bold,fontSize: 14),),
                      ),
                      SizedBox(height: Dimensions.height10/5,),
                      TextFieldApp(controller: otp,hint: "Code",icon: const Icon(Icons.lock),textInputType: TextInputType.text,isPassword: true, validation: 'OTP is empty, please enter your OTP'),
                      SizedBox(height: Dimensions.height20*1.5,),
                    ],
                  ),
                ):Container(),
                InkWell(
                  onTap: (){
                    if (otpVisibility) {
                      verifyOTP(context);
                    } else {
                      loginWithPhone();
                    }
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 15),
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: ColorsApp().primary,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Center(
                      child: Text(
                        otpVisibility ? "Verify" : "Login",style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),
                      ),
                    ),
                  ),
                ),

              ],
            ),
          );
        });
  }

  void loginWithPhone() async {
    _auth.verifyPhoneNumber(
      phoneNumber: '+20'+ phone.text,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _auth.signInWithCredential(credential).then((value) {
          print("You are logged in successfully");
        });
      },
      timeout: const Duration(seconds: 60),
      verificationFailed: (FirebaseAuthException e) {
        print(e.message);
      },
      codeSent: (String verificationId, int? resendToken) {
        otpVisibility = true;
        verificationId = verificationId;
        update();
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  void verifyOTP(BuildContext context) async {
    UserModel? userModel;

    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: otp.text);

    await _auth.signInWithCredential(credential).then(
          (usercredential) {
            userModel = UserModel(
                email: usercredential.user?.email,
                name: usercredential.user?.displayName,
                picture: usercredential.user?.photoURL,
                userId: usercredential.user?.uid);

            update();

            saveUserToFireStore(userModel!);
          },
    ).whenComplete(
          () {
            AppRoute.pushReplacement(const LandingPage(),name: 'landingPage');
          }
    );
  }

  Stream<List<UserModel>> getcurrentUser() =>
    FirebaseFirestore.instance.collection('users').where('userId',isEqualTo: FirebaseAuth.instance.currentUser!.uid).snapshots().map((query) {
      update();
      return query.docs.map((item) => UserModel.fromMap(item)).toList();});


}
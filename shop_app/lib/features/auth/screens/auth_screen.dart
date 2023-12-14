import 'package:shop_app/common/widgets/custom_button.dart';
import 'package:shop_app/common/widgets/custom_textfield.dart';
import 'package:shop_app/common/widgets/small_text.dart';
import 'package:shop_app/constains/global_variables.dart';
import 'package:shop_app/features/auth/service/auth_service.dart';
import 'package:flutter/material.dart';

// bien theo doi radio
enum Auth {
  signin,
  signup,
}

class AuthScreen extends StatefulWidget {
  static const String routeName = "/auth-screen";
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  //bien auth xac thu radio
  Auth _auth = Auth.signup;

  //bien form
  final _signUpFormKey = GlobalKey<FormState>();
  final _signInFormKey = GlobalKey<FormState>();

  //
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  //
  final AuthService authService = AuthService();

  //giải phóng tài nguyên
  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
  }

  // ham SignupUser
  void signUpUser() {
    //boo dieu khien
    authService.signUpUser(
        context: context,
        name: _nameController.text,
        email: _emailController.text,
        password: _passwordController.text);
  }

  // ham SignINUser
  void signInUser() {
    //boo dieu khien
    authService.signInUser(
        context: context,
        email: _emailController.text,
        password: _passwordController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.greyBackgroundCOlor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Wellcome",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                //nut radio Sign Up
                ListTile(
                  tileColor: _auth == Auth.signup
                      ? GlobalVariables.backgroundColor
                      : GlobalVariables.greyBackgroundCOlor,
                  title: const Text(
                    'Đăng ký tài khoản',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  leading: Radio(
                    activeColor: GlobalVariables.secondaryColor,
                    value: Auth.signup,
                    groupValue: _auth,
                    onChanged: (Auth? val) {
                      setState(() {
                        _auth = val!;
                      });
                    },
                  ),
                ),

                //neu chon Sign Up hien form
                if (_auth == Auth.signup)
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: GlobalVariables.backgroundColor,
                    child: Form(
                      key: _signUpFormKey,
                      child: Column(
                        children: [
                          CustomTextField(
                            controller: _nameController,
                            hintText: 'Tên người dùng',
                          ),
                          const SizedBox(height: 10),
                          CustomTextField(
                            controller: _emailController,
                            hintText: 'Email',
                          ),
                          const SizedBox(height: 10),
                          CustomTextField2(
                            controller: _passwordController,
                            hintText: 'Mật khẩu',
                          ),
                          const SizedBox(height: 10),
                          CustomButton(
                            text: 'Đăng ký',
                            onTap: () {
                              if (_signUpFormKey.currentState!.validate()) {
                                signUpUser();
                              }
                            },
                          )
                        ],
                      ),
                    ),
                  ),

                //nut radio Sign In
                ListTile(
                  tileColor: _auth == Auth.signin
                      ? GlobalVariables.backgroundColor
                      : GlobalVariables.greyBackgroundCOlor,
                  title: const Text(
                    'Đăng nhập',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  leading: Radio(
                    activeColor: GlobalVariables.secondaryColor,
                    value: Auth.signin,
                    groupValue: _auth,
                    onChanged: (Auth? val) {
                      setState(() {
                        _auth = val!;
                      });
                    },
                  ),
                ),

                //neu chon Sign In hien form
                if (_auth == Auth.signin)
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: GlobalVariables.backgroundColor,
                    child: Form(
                      key: _signInFormKey,
                      child: Column(
                        children: [
                          CustomTextField(
                            controller: _emailController,
                            hintText: 'Email',
                          ),
                          const SizedBox(height: 10),
                          CustomTextField2(
                            controller: _passwordController,
                            hintText: 'Password',
                          ),
                          const SizedBox(height: 10),
                          CustomButton(
                            text: 'Đăng Nhập',
                            onTap: () {
                              if (_signInFormKey.currentState!.validate()) {
                                signInUser();
                              }
                            },
                          )
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/*
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/common/widgets/custom_textfield.dart';
import 'package:shop_app/features/auth/service/auth_service.dart';
// import 'package:shop_ui/core.dart';

class AuthScreen extends StatefulWidget {
  static const String routeName = "/auth-screen";

  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => AuthScreenState();
}

class AuthScreenState extends State<AuthScreen> {
  //
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  //
  final AuthService authService = AuthService();

  //giải phóng tài nguyên
  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
  }

  // ham SignINUser
  void signInUser() {
    //boo dieu khien
    authService.signInUser(
        context: context,
        email: _emailController.text,
        password: _passwordController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      right: 0,
                      left: 0,
                      child: Container(
                        height: 285.0,
                        decoration: const BoxDecoration(
                          color: Color(0xff06AB8D),
                          image: DecorationImage(
                            image: AssetImage(
                              "assets/images/login_screen.png",
                            ),
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30.0, vertical: 31),
                              child: Column(
                                children: [
                                  Text(
                                    "Welcome",
                                    style: GoogleFonts.poppins(
                                        fontSize: 28,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    "Sign in to Continue",
                                    style: GoogleFonts.poppins(
                                        fontSize: 12,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      left: 0,
                      top: 255,
                      child: Container(
                        height: 600,
                        width: 375,
                        // ignore: prefer_const_constructors
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(
                              16.0,
                            ),
                          ),
                        ),
                        child: Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 35),
                              child: CustomTextField(
                                controller: _emailController,
                                hintText: 'Email',
                              ),
                              // TextFormField(
                              //   decoration: InputDecoration(
                              //     labelText: 'Your Email Address',
                              //     labelStyle: GoogleFonts.poppins(
                              //         fontSize: 12,
                              //         fontWeight: FontWeight.normal,
                              //         color: const Color(0xff8B9E9E)),
                              //     enabledBorder: const UnderlineInputBorder(
                              //       borderSide: BorderSide(
                              //         color: Colors.blueGrey,
                              //       ),
                              //     ),
                              //   ),
                              //   onChanged: (value) {},
                              // ),
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.only(left: 30, right: 30),
                              child: CustomTextField(
                                controller: _passwordController,
                                hintText: 'Mật Khẩu',
                              ),
                              // TextFormField(
                              //   decoration: InputDecoration(
                              //     labelText: 'Password',
                              //     labelStyle: GoogleFonts.poppins(
                              //         fontSize: 12,
                              //         fontWeight: FontWeight.normal,
                              //         color: const Color(0xff8B9E9E)),
                              //     enabledBorder: const UnderlineInputBorder(
                              //       borderSide: BorderSide(
                              //         color: Colors.blueGrey,
                              //       ),
                              //     ),
                              //   ),
                              //   onChanged: (value) {},
                              // ),
                            ),
                            const SizedBox(
                              height: 44.0,
                            ),
                            Container(
                              height: 20.0,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 31.0),
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(
                                    16.0,
                                  ),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Radio(
                                    value: 0,
                                    groupValue: 1,
                                    onChanged: (value) {},
                                  ),
                                  Text("Remember me",
                                      style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          fontWeight: FontWeight.normal,
                                          color: const Color(0xff899B9A))),
                                  const Spacer(),
                                  Text("Forgot Password?",
                                      style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          fontWeight: FontWeight.normal,
                                          color: const Color(0xffFF8933))),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 71.0,
                            ),
                            SizedBox(
                              width: 325,
                              height: 50,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xffFFB039),
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(50), // <-- Radius
                                  ),
                                ),
                                onPressed: () {
                                  signInUser();
                                },
                                child: Text(
                                  "Sign In",
                                  style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 80.0,
                            ),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                height: 20.0,
                                width: 219,
                                decoration: const BoxDecoration(),
                                child: Row(
                                  children: [
                                    Text(
                                      "Don’t have an account?",
                                      style: GoogleFonts.poppins(
                                          fontSize: 13,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.black),
                                    ),
                                    // InkWell(
                                    //   onTap: () {
                                    //     Navigator.pushReplacement(
                                    //       context,
                                    //       MaterialPageRoute(
                                    //           builder: (context) =>
                                    //               const RegisterView()),
                                    //     );
                                    //   },
                                    //   child: Text(
                                    //     " Sign Up",
                                    //     style: GoogleFonts.poppins(
                                    //         fontSize: 13,
                                    //         fontWeight: FontWeight.normal,
                                    //         color: const Color(0xffFF8933)),
                                    //   ),
                                    // ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
*/
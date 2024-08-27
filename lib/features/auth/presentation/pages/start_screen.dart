import 'package:flutter/material.dart';
import 'package:nerd_test/core/utils/text_styles.dart';
import 'package:nerd_test/features/auth/presentation/pages/login_screen.dart';
import 'package:nerd_test/features/auth/presentation/pages/register_screen.dart';
import 'package:nerd_test/features/auth/presentation/widgets/rounded_image.dart';
import 'package:nerd_test/shared/widgets/primary_button.dart';
import 'package:nerd_test/shared/widgets/secondary_button.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    final double mainContentHeight = screenHeight * 2 / 3;
    final double buttonSectionHeight = screenHeight / 3;
    final double boxSize = mainContentHeight / 2;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            child: SizedBox(
              width: screenWidth,
              height: mainContentHeight,
              child: Stack(
                children: [
                  Positioned(
                    left: -boxSize / 3,
                    top: 0,
                    child: Container(
                      width: boxSize,
                      height: boxSize,
                      child: Column(
                        children: [
                          const Expanded(
                            flex: 3,
                            child: SizedBox(
                              width: double.infinity,
                              child: RoundedImage(
                                imageFileName: 'assets/images/2.png',
                                boxFit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black54,
                                    blurRadius: 10,
                                    spreadRadius: 2,
                                    offset: Offset(0, 6),
                                  ),
                                ],
                              ),
                              child: const RoundedImage(
                                imageFileName: 'assets/images/4.png',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: -boxSize / 3,
                    top: boxSize,
                    child: Container(
                      width: boxSize,
                      height: boxSize,
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black54,
                            blurRadius: 10,
                            spreadRadius: 2,
                            offset: Offset(0, 6),
                          ),
                        ],
                      ),
                      child: const RoundedImage(
                        imageFileName: 'assets/images/8.png',
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    top: 0,
                    child: SizedBox(
                      width: screenWidth * 2 / 3,
                      height: boxSize,
                      child: const RoundedImage(
                        imageFileName: 'assets/images/3.png',
                        boxFit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    top: boxSize,
                    child: SizedBox(
                      width: screenWidth * 2 / 3,
                      height: boxSize,
                      child: Stack(
                        children: [
                          Positioned(
                            right: 0,
                            top: 0,
                            width: screenWidth * 2 / 3 * 3 / 4,
                            height: boxSize / 2,
                            child: Container(
                              decoration: const BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black54,
                                    blurRadius: 10,
                                    spreadRadius: 2,
                                    offset: Offset(0, 6),
                                  ),
                                ],
                              ),
                              child: const RoundedImage(
                                imageFileName: 'assets/images/5.png',
                              ),
                            ),
                          ),
                          Positioned(
                            right: 0,
                            top: boxSize / 2,
                            width: screenWidth * 2 / 3 * 3 / 4,
                            height: boxSize / 2,
                            child: Transform.rotate(
                              angle: 3.14159,
                              child: Container(
                                decoration: const BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black54,
                                      blurRadius: 10,
                                      spreadRadius: 2,
                                      offset: Offset(0, 6),
                                    ),
                                  ],
                                ),
                                child: const RoundedImage(
                                  imageFileName: 'assets/images/9.png',
                                  boxFit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 0,
                            top: 0,
                            width: screenWidth * 2 / 3 / 4,
                            height: boxSize / 4,
                            child: const RoundedImage(
                              imageFileName: 'assets/images/6.png',
                              boxFit: BoxFit.fill,
                              borderRadius: 10,
                            ),
                          ),
                          Positioned(
                            left: 0,
                            bottom: 0,
                            width: screenWidth * 2 / 3 / 4,
                            height: boxSize * 3 / 4,
                            child: Container(
                              decoration: const BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black54,
                                    blurRadius: 10,
                                    spreadRadius: 2,
                                    offset: Offset(0, 6),
                                  ),
                                ],
                              ),
                              child: const RoundedImage(
                                imageFileName: 'assets/images/7.png',
                                borderRadius: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              width: screenWidth,
              height: buttonSectionHeight,
              color: Colors.black,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PrimaryButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegisterScreen(),
                        ),
                      );
                    },
                    text: 'Create an Account',
                  ),
                  SecondaryButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    },
                    text: 'Login',
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: screenHeight * 0.45,
            left: 0,
            right: 0,
            child: const Center(
              child: SizedBox(
                width: 333,
                child: Text(
                  'Create anything you want with AI',
                  textAlign: TextAlign.center,
                  style: TextStyles.heading1,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

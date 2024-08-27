import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nerd_test/core/utils/gradients.dart';
import 'package:nerd_test/core/utils/text_styles.dart';
import 'package:nerd_test/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:nerd_test/features/auth/presentation/bloc/auth_event.dart';
import 'package:nerd_test/features/auth/presentation/bloc/auth_state.dart';
import 'package:nerd_test/features/auth/presentation/pages/login_screen.dart';
import 'package:nerd_test/features/auth/presentation/widgets/custom_bottom_navbar.dart';
import 'package:nerd_test/shared/widgets/custom_textfield.dart';
import 'package:nerd_test/shared/widgets/gradient_text_button.dart';
import 'package:nerd_test/shared/widgets/primary_button.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _agreeToTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 50),
        child: ListView(
          children: [
            const Text(
              'Create an Account',
              style: TextStyles.heading2,
            ),
            const SizedBox(
              height: 12,
            ),
            CustomTextField(
              controller: _nameController,
              hintText: 'Please write your name',
              labelText: 'Name',
            ),
            CustomTextField(
              controller: _emailController,
              hintText: 'jaki@gmail.com',
              labelText: 'E-mail Address',
            ),
            CustomTextField(
              controller: _passwordController,
              hintText: '****',
              labelText: 'Password',
              isPassword: true,
            ),
            Row(
              children: [
                SizedBox(
                  width: 24,
                  height: 24,
                  child: Checkbox(
                    value: _agreeToTerms,
                    onChanged: (value) {
                      setState(() {
                        _agreeToTerms = value ?? false;
                      });
                    },
                    activeColor: Colors.blue,
                    checkColor: Colors.white,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    side: const BorderSide(color: Color(0xFFEFEFEF), width: 2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                const Text('I agree with'),
                GradientTextButton(
                  text: 'Terms and Conditions',
                  textStyle: TextStyles.labelText,
                  gradient: AppGradients.primaryGradientB,
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('terms and conditions')),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            BlocConsumer<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is Authenticated) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Registration Successful')),
                  );
                  // Navigate to next screen or home screen
                } else if (state is AuthError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.message)),
                  );
                }
              },
              builder: (context, state) {
                if (state is AuthLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                return PrimaryButton(
                  onPressed: _agreeToTerms
                      ? () {
                          context.read<AuthBloc>().add(
                                RegisterRequested(
                                  email: _emailController.text,
                                  name: _nameController.text,
                                  password: _passwordController.text,
                                ),
                              );
                        }
                      : () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('You must agree to terms')),
                          );
                        },
                  text: 'Create an Account',
                );
              },
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Already have an account?'),
                const SizedBox(
                  width: 8,
                ),
                GradientTextButton(
                  gradient: AppGradients.primaryGradientA,
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ));
                  },
                  text: 'Login',
                  textStyle: TextStyles.labelText,
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavBar(),
    );
  }
}

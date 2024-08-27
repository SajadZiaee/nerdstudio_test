import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nerd_test/core/utils/gradients.dart';
import 'package:nerd_test/core/utils/text_styles.dart';
import 'package:nerd_test/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:nerd_test/features/auth/presentation/bloc/auth_event.dart';
import 'package:nerd_test/features/auth/presentation/bloc/auth_state.dart';
import 'package:nerd_test/features/auth/presentation/pages/register_screen.dart';
import 'package:nerd_test/features/auth/presentation/widgets/custom_bottom_navbar.dart';
import 'package:nerd_test/features/chat/presentation/pages/chat_screen.dart';
import 'package:nerd_test/shared/widgets/custom_textfield.dart';
import 'package:nerd_test/shared/widgets/gradient_text_button.dart';
import 'package:nerd_test/shared/widgets/primary_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 50),
        child: ListView(
          children: [
            const Text(
              'Login',
              style: TextStyles.heading2,
            ),
            const SizedBox(
              height: 12,
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
            const SizedBox(
              height: 12,
            ),
            BlocConsumer<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is Authenticated) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Login Successful')),
                  );
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ChatScreen(),
                      ));
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
                  onPressed: () {
                    context.read<AuthBloc>().add(
                          LoginRequested(
                            email: _emailController.text,
                            password: _passwordController.text,
                          ),
                        );
                  },
                  text: 'Login',
                );
              },
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Already haven\'t an account?'),
                const SizedBox(
                  width: 8,
                ),
                GradientTextButton(
                  gradient: AppGradients.primaryGradientA,
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegisterScreen(),
                        ));
                  },
                  text: 'Sign Up',
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

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secure_banking_wallet_day13/features/auth/presentation/bloc/blocs/login_bloc.dart';
import 'package:secure_banking_wallet_day13/features/auth/presentation/bloc/events/login_event.dart';
import 'package:secure_banking_wallet_day13/features/auth/presentation/bloc/states/login_state.dart';
import 'package:secure_banking_wallet_day13/features/dashboard/presentation/pages/dashboard_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() =>
      _LoginPageState();
}

class _LoginPageState
    extends State<LoginPage> {

  final emailController =
  TextEditingController();

  final passwordController =
  TextEditingController();

  bool obscurePassword = true;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xff0F172A),
              Color(0xff1E3A8A),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),

        child: SafeArea(
          child: BlocConsumer<
              AuthBloc,
              AuthState>(
            listener: (context, state) {

              if (state is AuthSuccess) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                    const DashboardPage(),
                  ),
                );
              }

              if (state is AuthError) {

                ScaffoldMessenger.of(context)
                    .showSnackBar(
                  SnackBar(
                    content: Text(
                      state.message,
                    ),
                  ),
                );
              }
            },

            builder: (context, state) {

              return SingleChildScrollView(
                padding:
                const EdgeInsets.all(24),

                child: Column(
                  children: [

                    const SizedBox(
                      height: 70,
                    ),

                    Container(
                      height: 120,
                      width: 120,

                      decoration:
                      BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                        BorderRadius.circular(
                          30,
                        ),
                      ),

                      child: const Icon(
                        Icons.security,
                        size: 70,
                        color: Colors.blue,
                      ),
                    ),

                    const SizedBox(
                      height: 20,
                    ),

                    const Text(
                      "SecurePay",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight:
                        FontWeight.bold,
                      ),
                    ),

                    const SizedBox(
                      height: 8,
                    ),

                    const Text(
                      "Secure Banking Experience",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                      ),
                    ),

                    const SizedBox(
                      height: 50,
                    ),

                    Container(
                      padding:
                      const EdgeInsets.all(
                        20,
                      ),

                      decoration:
                      BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                        BorderRadius.circular(
                          20,
                        ),
                      ),

                      child: Column(
                        children: [

                          TextField(
                            controller:
                            emailController,

                            decoration:
                            InputDecoration(
                              prefixIcon:
                              const Icon(
                                Icons.email,
                              ),
                              labelText:
                              "Email",
                              border:
                              OutlineInputBorder(
                                borderRadius:
                                BorderRadius.circular(
                                  12,
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(
                            height: 20,
                          ),

                          TextField(
                            controller:
                            passwordController,

                            obscureText:
                            obscurePassword,

                            decoration:
                            InputDecoration(
                              prefixIcon:
                              const Icon(
                                Icons.lock,
                              ),

                              suffixIcon:
                              IconButton(
                                icon: Icon(
                                  obscurePassword
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                                onPressed: () {
                                  setState(() {
                                    obscurePassword =
                                    !obscurePassword;
                                  });
                                },
                              ),

                              labelText:
                              "Password",

                              border:
                              OutlineInputBorder(
                                borderRadius:
                                BorderRadius.circular(
                                  12,
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(
                            height: 30,
                          ),

                          SizedBox(
                            width:
                            double.infinity,
                            height: 55,

                            child:
                            ElevatedButton(
                              onPressed:
                              state
                              is AuthLoading
                                  ? null
                                  : () {

                                context
                                    .read<
                                    AuthBloc>()
                                    .add(
                                  LoginEvent(
                                    emailController
                                        .text
                                        .trim(),
                                    passwordController
                                        .text
                                        .trim(),
                                  ),
                                );
                              },

                              child:
                              state
                              is AuthLoading
                                  ? const CircularProgressIndicator()
                                  : const Text(
                                "LOGIN",
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(
                      height: 25,
                    ),

                    Container(
                      width:
                      double.infinity,

                      padding:
                      const EdgeInsets.all(
                        16,
                      ),

                      decoration:
                      BoxDecoration(
                        color: Colors.white
                            .withOpacity(
                          0.15,
                        ),

                        borderRadius:
                        BorderRadius.circular(
                          15,
                        ),
                      ),

                      child: const Column(
                        children: [

                          Text(
                            "Demo Credentials",
                            style:
                            TextStyle(
                              color:
                              Colors.white,
                              fontWeight:
                              FontWeight.bold,
                            ),
                          ),

                          SizedBox(
                            height: 10,
                          ),

                          Text(
                            "Email: admin@securepay.com",
                            style:
                            TextStyle(
                              color:
                              Colors.white,
                            ),
                          ),

                          Text(
                            "Password: Admin@123",
                            style:
                            TextStyle(
                              color:
                              Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

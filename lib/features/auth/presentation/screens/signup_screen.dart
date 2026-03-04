import 'package:courses_app/core/functions.dart';
import 'package:courses_app/core/theme/text_style.dart';
import 'package:courses_app/core/widgets/custom_button.dart';
import 'package:courses_app/core/widgets/custom_text_form_feild.dart';
import 'package:courses_app/features/auth/data/repo/auth_repo/auth_repo.dart';
import 'package:courses_app/features/auth/presentation/cubit/auth_cubit/auth_cubit.dart';
import 'package:courses_app/features/auth/presentation/cubit/auth_cubit/auth_state.dart';
import 'package:courses_app/features/auth/presentation/screens/login_screen.dart';
import 'package:courses_app/core/widgets/textwidget.dart';
import 'package:courses_app/core/widgets/topscreenwidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final signupformKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();


  @override
  void dispose(){
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
  }

  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return AuthCubit(AuthRepo());
      },
      child: BlocConsumer<AuthCubit, AuthState>(
        listener :(context, state){
          if (state is SignupErrorState){
            snakBarMessage(context: context, text: state.errmsg);
          }
          if (state is SignupSuccessState){
            Navigator.pushReplacement(context, 
            MaterialPageRoute(builder: (context){
              return const LoginScreen();
            }
            )
            );
          }
        },

        builder:(context, state){
          return Scaffold(
          body: SingleChildScrollView(
            child: Form(
              key: signupformKey,
              child: Column(
                children: [
                  TopScreen(text: 'SignUp'),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 40,),
                        TextWidget(text: 'Name'),
                        SizedBox(height: 12,),
                        CustomTextFormField(
                          controller:nameController,
                          validator: (value){
                            if (value == null || value.isEmpty){
                              return 'Inter your Name' ;
                              }
                              return null ;
                          },
                          prefixIcon: Icon(Icons.person),
                          label: Text('Name'),
                        ),
                        SizedBox(height: 20,),
                        TextWidget(text: 'Email'),
                        SizedBox(height: 12,),
                        CustomTextFormField(
                          controller:emailController,
                          validator: (value){
                      
                            if (!value!.contains('@')){
                              return 'Invalid Email' ;
                              }
                            if (value.isEmpty){
                              return 'Inter your email' ;
                              }
                              return null ;
                          },
                          prefixIcon: Icon(Icons.email),
                          label: Text('Email'),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        SizedBox(height: 20,),
                        TextWidget(text: 'Password'),
                        SizedBox(height: 12,),
                        CustomTextFormField(
                          controller:passwordController,
                          validator: (value){
                            if (value!.length < 6){
                             return 'Please enter a strong password' ;
                              }
                            if (value.isEmpty){
                              return 'Inter your password' ;
                              }
                              return null ;
                          },
                          prefixIcon: Icon(Icons.lock),
                          label: Text('Password'),
                          obscureText: true,
                        ),
                        SizedBox(height: 30,),
                        state is SignupLoadingState ? CircularProgressIndicator() :
                        CustomButton(text: 'SignUp', onPressed: (){
                          if (signupformKey.currentState!.validate()){
                                  context.read<AuthCubit>().signup(
                                    name:nameController.text.trim(),
                                    email:emailController.text.trim(),
                                    password:passwordController.text.trim());
                              }
                        }
                        ),
                          ],
                          ),
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                            const Text('Already have an account?',
                            style:AppTextStyles.s15bold,
                            ),
                            const SizedBox(width: 10,),
                            TextButton(onPressed: (){},
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              minimumSize: Size.zero,
                            ),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(context,
                                MaterialPageRoute(builder: (context){
                                  return const LoginScreen();
                                }
                                )
                                );
                              },
                              child: const Text('Login',
                              style:AppTextStyles.sbold,
                              ),
                            ),
                            ),
                          ],
                          ),
                        ],
                    ),
            ),
          ),
        );
        },
      ),
    );
  }
}
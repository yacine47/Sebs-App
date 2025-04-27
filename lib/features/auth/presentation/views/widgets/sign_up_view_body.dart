import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sebs_app/core/widgets/app_styles.dart';
import 'package:sebs_app/core/widgets/custom_button.dart';
import 'package:sebs_app/core/widgets/custom_text_form_field.dart';
import 'package:sebs_app/core/widgets/err_message_widget_auth.dart';
import 'package:sebs_app/features/auth/presentation/view_models/sign_up/sign_up_cubit.dart';
import 'package:sebs_app/features/auth/presentation/views/login_view.dart';
import 'package:sebs_app/features/auth/presentation/views/widgets/custom_drop_down_button.dart';
import 'package:sebs_app/features/auth/presentation/views/widgets/other_option.dart';
import 'package:sebs_app/features/home/presentation/views/home_view.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  String? password; // <- ADD THIS
  String? valueRole;
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    final double spaceBetweenTextField = MediaQuery.of(context).size.height * .02;
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpSuccess) {
          GoRouter.of(context).push(HomeView.path);
        }
      },
      builder: (context, state) {
        return Form(
          key: formKey,
          child: SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 28),
                //  const GoBackButton(),
                const SizedBox(height: 24),
                Text(
                  'Welcome !\nCreate your Account',
                  style: Styles.style40,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * .02),
                ErrMessageWidgetAuth(
                  isLoading: state is SignUpFailure,
                  state: state,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * .02),
                Row(
                  children: [
                    Flexible(
                      child: CustomTextFormField(
                        prefixIcon: Icons.person,
                        onSaved: (value) => BlocProvider.of<SignUpCubit>(context).userModel.firstName = value,
                        hint: 'First Name',
                      ),
                    ),
                    const SizedBox(width: 18),
                    Flexible(
                      child: CustomTextFormField(
                        onSaved: (value) => BlocProvider.of<SignUpCubit>(context).userModel.lastName = value,
                        hint: 'Last Name',
                        prefixIcon: Icons.person,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                CustomTextFormField(
                  onSaved: (value) => BlocProvider.of<SignUpCubit>(context).userModel.email = value,
                  hint: 'Email',
                  prefixIcon: Icons.email_rounded,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    // Simple email regex
                    bool isValidEmail = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value);
                    if (!isValidEmail) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),

                SizedBox(height: spaceBetweenTextField),
                CustomTextFormField(
                  onSaved: (value) => BlocProvider.of<SignUpCubit>(context).userModel.password = value,
                  hint: 'Password',
                  onChanged: (value) => password = value, // <- STORE IT ON CHANGE
                  prefixIcon: Icons.lock_rounded,
                  isPassword: true,
                ),
                SizedBox(height: spaceBetweenTextField),
                CustomTextFormField(
                  onSaved: (value) => BlocProvider.of<SignUpCubit>(context).userModel.passwordConfirmation = value,
                  hint: 'Confirm Password',
                  prefixIcon: Icons.lock_rounded,
                  isPassword: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please confirm your password';
                    } else if (value != password) {
                      // <- COMPARE TO LOCAL PASSWORD
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),

                SizedBox(height: spaceBetweenTextField),
                CustomDropDownButton(
                  valueRole: valueRole,
                  onSaved: (value) => BlocProvider.of<SignUpCubit>(context).userModel.role = value,
                  onChanged: (value) {
                    valueRole = value;
                    setState(() {});
                  },
                ),
                const SizedBox(height: 34),
                CustomButton(
                  title: 'Sign up',
                  isLoadingState: state is SignUpLoading,
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      await BlocProvider.of<SignUpCubit>(context).signUp();
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                    }
                  },
                ),
                const SizedBox(height: 21),
                OtherOption(
                  text: 'Already have an account?',
                  buttonText: 'Sign in',
                  onTap: () => GoRouter.of(context).pop(),
                )
              ],
            ),
          )),
        );
      },
    );
  }
}

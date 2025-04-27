import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sebs_app/core/utils/app_colors.dart';
import 'package:sebs_app/core/widgets/app_styles.dart';
import 'package:sebs_app/core/widgets/custom_button.dart';
import 'package:sebs_app/core/widgets/custom_text_form_field.dart';
import 'package:sebs_app/core/widgets/err_message_widget_auth.dart';
import 'package:sebs_app/features/auth/presentation/view_models/login/login_cubit.dart';
import 'package:sebs_app/features/auth/presentation/views/sign_up_view.dart';
import 'package:sebs_app/features/auth/presentation/views/widgets/other_option.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  GlobalKey<FormState> formKey = GlobalKey();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          // navigateToHomeView(state, context);
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
                const SizedBox(height: 24),
                Text(
                  'Sign in to your Account',
                  style: Styles.style40,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * .07),
                ErrMessageWidgetAuth(
                  isLoading: state is LoginFailure,
                  state: state,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * .07),
                CustomTextFormField(
                  hint: 'Email',
                  prefixIcon: Icons.email_rounded,
                  // onSaved: (value) => BlocProvider.of<LoginCubit>(context).userModel.email = value,
                ),
                const SizedBox(height: 22),
                CustomTextFormField(
                  hint: 'Password',
                  prefixIcon: Icons.lock_rounded,
                  isPassword: true,
                  // onSaved: (value) => BlocProvider.of<LoginCubit>(context).userModel.password = value,
                ),
                const SizedBox(height: 22),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Forgot the password?',
                    textAlign: TextAlign.center,
                    style: Styles.style16.copyWith(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 22),
                CustomButton(
                  isLoadingState: state is LoginLoading,
                  title: 'Sign in',
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      // BlocProvider.of<LoginCubit>(context).login();
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  },
                ),
                const SizedBox(height: 21),
                OtherOption(
                  text: 'Don\'t have an account?',
                  buttonText: 'Sign up',
                  onTap: () => GoRouter.of(context).push(SignUpView.path),
                )
              ],
            ),
          )),
        );
      },
    );
  }
}

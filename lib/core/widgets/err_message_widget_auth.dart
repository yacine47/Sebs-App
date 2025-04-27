import 'package:flutter/material.dart';
import 'package:sebs_app/core/widgets/app_styles.dart';

class ErrMessageWidgetAuth extends StatelessWidget {
  const ErrMessageWidgetAuth({super.key, required this.state, required this.isLoading});
  final dynamic state;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Align(
            child: Text(
              state.errMessage,
              style: Styles.style14.copyWith(color: Colors.red),
            ),
          )
        : const SizedBox();
  }
}

import 'package:flutter/material.dart';
import 'package:sebs_app/core/utils/app_colors.dart';
import 'package:sebs_app/core/widgets/app_styles.dart';

class CustomDropDownButton extends StatelessWidget {
  const CustomDropDownButton({super.key, this.onChanged, required this.valueRole, this.onSaved});
  final void Function(String?)? onChanged;
  final Function(String?)? onSaved;
  final String? valueRole;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      alignment: Alignment.center,
      decoration: BoxDecoration(color: AppColors.textFieldColor, borderRadius: BorderRadius.circular(12)),
      child: DropdownButtonFormField<String>(
        iconEnabledColor: AppColors.hintColorTextField,
        items: const [
          DropdownMenuItem(
            value: 'simple_user',
            child: Text('Simple User'),
          ),
          DropdownMenuItem(
            value: 'event_manager',
            child: Text('Event Manager'),
          ),
        ],
        isExpanded: true,
        padding: const EdgeInsets.symmetric(vertical: 6),
        dropdownColor: AppColors.textFieldColor,
        hint: Text(
          'Select Your Role',
          style: Styles.style14,
        ),
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.only(left: 16, right: 14),
          border: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.all(Radius.circular(12))),
        ),
        enableFeedback: true,
        borderRadius: BorderRadius.circular(12),
        value: valueRole,
        onChanged: onChanged,
        validator: (value) {
          if (value == null) {
            return 'Please select a role';
          }
          return null;
        },
        onSaved: onSaved,
      ),
    );
  }
}

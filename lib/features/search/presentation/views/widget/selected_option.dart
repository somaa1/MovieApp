import 'package:flutter/material.dart';

import '../../../../../core/configs/theme/app_colors.dart';

class SelectedOption extends StatelessWidget {
  const SelectedOption({super.key, required this.isSelected, required this.title, this.onTap});
final bool isSelected;
final String title;
final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onTap,
      child: Container(
        width: 80,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
              color: isSelected ? AppColors.primary : AppColors.secondBackground
        ),
        child: Center(child: Text(title)),
      ),
    );
  }
}

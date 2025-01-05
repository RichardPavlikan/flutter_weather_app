import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

/// [AppDivider] is the divider widget for the application.
class AppDivider extends StatelessWidget {
  const AppDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SizedBox(
        width: 70.w,
        child: Divider(
          color: Colors.grey.withOpacity(0.5),
        ),
      ),
    );
  }
}

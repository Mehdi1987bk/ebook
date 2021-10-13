import 'package:flutter/material.dart';
import 'package:kango/presentation/resourses/app_colors.dart';

class SuccessfulPaymentScreen extends StatelessWidget {
  const SuccessfulPaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        const Expanded(
          child: Center(
            child: Icon(
              Icons.check_circle_outline,
              size: 56,
              color: AppColors.appColor,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Ödəniş uğurlu alındı'),
          ),
        )
      ]),
    );
  }
}

import 'package:app/features/auth/login_controller.dart';
import 'package:app/widgets/button.dart';
import 'package:app/widgets/form_input.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  Widget build(BuildContext context, LoginController controller) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: controller.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FormInput(
                icon: Icons.person,
                label: "username",
                onChanged: (value) {
                  controller.username = value;
                },
              ),
              FormInput(
                icon: Icons.password,
                label: "password",
                onChanged: (value) {
                  controller.password = value;
                },
              ),
              Button(
                title: "Login",
                onPress: () => controller.doLogin(),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<LoginScreen> createState() => LoginController();
}

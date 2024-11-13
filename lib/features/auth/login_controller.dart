import 'package:app/features/auth/login_screen.dart';
import 'package:app/services/auth_service.dart';
import 'package:app/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginController extends State<LoginScreen> {
  static late LoginController instance;
  late LoginScreen view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? username;
  String? password;
  doLogin() async {
    bool isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    }

    showLoading();

    await AuthService().login(username: username!, password: password!);

    hideLoading();
  }
}

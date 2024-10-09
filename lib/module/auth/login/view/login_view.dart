import 'package:e_library_ciheul/shared/theme/theme_config.dart';
import 'package:e_library_ciheul/shared/util/validator.dart';
import 'package:e_library_ciheul/shared/widget/button/QButton.dart';
import 'package:e_library_ciheul/shared/widget/textfield/QTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../controller/login_controller.dart';
import '../state/login_state.dart';
import 'package:get_it/get_it.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  LoginController controller = LoginController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void initState() {
    if (GetIt.I.isRegistered<LoginController>()) {
      GetIt.I.unregister<LoginController>();
    }
    GetIt.I.registerSingleton(controller);
    controller.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => controller.ready(),
    );
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => controller,
      child: BlocListener<LoginController, LoginState>(
        listener: (context, state) {},
        child: BlocBuilder<LoginController, LoginState>(
          builder: (context, state) {
            final bloc = context.read<LoginController>();
            return buildView(context, bloc, state);
          },
        ),
      ),
    );
  }

  Widget buildView(
    BuildContext context,
    LoginController controller,
    LoginState state,
  ) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
              top: 0,
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [
                      primaryColor.withBlue(3),
                      primaryColor,
                    ],
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 20,
                    top: 40,
                  ),
                  child: Text(
                    "Sign in",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 1,
              top: 100,
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x19000000),
                      blurRadius: 100,
                      offset: Offset(0, 11),
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: SingleChildScrollView(
                    controller: ScrollController(),
                    child: Column(
                      children: [
                        Form(
                          key: formKey,
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 20.0,
                              ),
                              QTextField(
                                label: "Email",
                                validator: Validator.email,
                                value: null,
                                onChanged: (value) {
                                  state.email = value;
                                },
                              ),
                              QTextField(
                                label: "Password",
                                obscure: true,
                                validator: Validator.required,
                                suffixIcon: Icons.password,
                                value: null,
                                onChanged: (value) {
                                  state.password = value;
                                },
                              ),
                              QButton(
                                label: "Login",
                                onPressed: () {
                                  bool isNotValid =
                                      formKey.currentState!.validate() == false;
                                  if (isNotValid) {
                                    return;
                                  }
                                  controller.login();
                                },
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Belum punya akun ? ",
                              style: TextStyle(
                                fontSize: 12.0,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                controller.register();
                              },
                              child: Text(
                                "Daftar sekarang",
                                style: TextStyle(
                                  fontSize: 12.0,
                                  color: primaryColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

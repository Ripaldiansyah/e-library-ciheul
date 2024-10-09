import 'package:e_library_ciheul/shared/theme/theme_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core.dart';
import '../controller/register_controller.dart';
import '../state/register_state.dart';
import 'package:get_it/get_it.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  RegisterController controller = RegisterController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void initState() {
    if (GetIt.I.isRegistered<RegisterController>()) {
      GetIt.I.unregister<RegisterController>();
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
      child: BlocListener<RegisterController, RegisterState>(
        listener: (context, state) {},
        child: BlocBuilder<RegisterController, RegisterState>(
          builder: (context, state) {
            final bloc = context.read<RegisterController>();
            return buildView(context, bloc, state);
          },
        ),
      ),
    );
  }

  Widget buildView(
    BuildContext context,
    RegisterController controller,
    RegisterState state,
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () => controller.login(),
                      icon: const Icon(
                        Icons.arrow_back,
                        size: 24.0,
                        color: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 20,
                        top: 5,
                      ),
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
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
                                label: "Fullname",
                                validator: Validator.required,
                                value: null,
                                onChanged: (value) {
                                  state.fullName = value;
                                },
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
                              QTextField(
                                label: "Confirm password",
                                obscure: true,
                                validator: Validator.required,
                                suffixIcon: Icons.password,
                                value: null,
                                onChanged: (value) {
                                  state.passwordConfirm = value;
                                },
                              ),
                              QButton(
                                label: "Sign Up",
                                onPressed: () async {
                                  bool isNotValid =
                                      formKey.currentState!.validate() == false;
                                  if (isNotValid) {
                                    return;
                                  }

                                  if (controller.isPasswordMatch()) {
                                    return snackbarWarning(
                                        message:
                                            "Password and confirm password do not match.");
                                  }

                                  if (await controller.isRegistered()) {
                                    return snackbarWarning(
                                        message:
                                            "This email is already registered");
                                  }
                                  await controller.register();
                                },
                              ),
                            ],
                          ),
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

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core.dart';
import '../controller/add_category_controller.dart';
import '../state/add_category_state.dart';
import 'package:get_it/get_it.dart';

class AddCategoryView extends StatefulWidget {
  const AddCategoryView({super.key});

  @override
  State<AddCategoryView> createState() => _AddCategoryViewState();
}

class _AddCategoryViewState extends State<AddCategoryView> {
  AddCategoryController controller = AddCategoryController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void initState() {
    if (GetIt.I.isRegistered<AddCategoryController>()) {
      GetIt.I.unregister<AddCategoryController>();
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
      child: BlocListener<AddCategoryController, AddCategoryState>(
        listener: (context, state) {},
        child: BlocBuilder<AddCategoryController, AddCategoryState>(
          builder: (context, state) {
            final bloc = context.read<AddCategoryController>();
            return buildView(context, bloc, state);
          },
        ),
      ),
    );
  }

  Widget buildView(
    BuildContext context,
    AddCategoryController controller,
    AddCategoryState state,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Kategori'),
      ),
      body: SingleChildScrollView(
        controller: ScrollController(),
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                QTextField(
                  label: "Label Kategori",
                  validator: Validator.required,
                  value: null,
                  onChanged: (value) {
                    state.label = value;
                  },
                ),
                Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: QTextField(
                          label: "Upload Cover Kategori",
                          validator: Validator.required,
                          value: state.pathCover,
                          enabled: false,
                          onChanged: (value) {},
                        ),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Container(
                        width: 100,
                        child: QButton(
                          label: "Upload",
                          onPressed: () async {
                            await controller.uploadCover();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(8.0),
        child: QButton(
          label: "Simpan",
          onPressed: () async {
            bool isNotValid = formKey.currentState!.validate() == false;
            if (isNotValid) {
              return;
            }
            if (await controller.checkCategoryRegisterd()) {
              snackbarWarning(message: "This category is already registered.");
              return;
            }

            controller.addCategory();
          },
        ),
      ),
    );
  }
}

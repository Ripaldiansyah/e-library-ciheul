import 'package:e_library_ciheul/shared/widget/dropdown/QDropDown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core.dart';
import 'package:get_it/get_it.dart';

class UploadBookView extends StatefulWidget {
  const UploadBookView({super.key});

  @override
  State<UploadBookView> createState() => _UploadBookViewState();
}

class _UploadBookViewState extends State<UploadBookView> {
  UploadBookController controller = UploadBookController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void initState() {
    if (GetIt.I.isRegistered<UploadBookController>()) {
      GetIt.I.unregister<UploadBookController>();
    }
    GetIt.I.registerSingleton(controller);
    controller.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => controller.initState(),
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
      child: BlocListener<UploadBookController, UploadBookState>(
        listener: (context, state) {},
        child: BlocBuilder<UploadBookController, UploadBookState>(
          builder: (context, state) {
            final bloc = context.read<UploadBookController>();
            return buildView(context, bloc, state);
          },
        ),
      ),
    );
  }

  Widget buildView(
    BuildContext context,
    UploadBookController controller,
    UploadBookState state,
  ) {
    return state.isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Scaffold(
            appBar: AppBar(
              title: const Text('Upload Book'),
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
                        label: "Judul Buku",
                        validator: Validator.required,
                        value: null,
                        onChanged: (value) {
                          state.title = value;
                        },
                      ),
                      QTextField(
                        label: "Nama Pengarang",
                        validator: Validator.required,
                        value: null,
                        onChanged: (value) {
                          state.author = value;
                        },
                      ),
                      QDropdownField(
                        label: "Kategori",
                        validator: Validator.required,
                        items: state.categories!,
                        onChanged: (value, label) {
                          state.category = int.parse(value);
                        },
                      ),
                      Container(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: QTextField(
                                label: "Upload Cover Buku",
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
                                label: "Cover",
                                onPressed: () async {
                                  await controller.uploadBookCover();
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: QTextField(
                                label: "Upload Buku",
                                validator: Validator.required,
                                value: state.pathPdf,
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
                                label: "PDF",
                                onPressed: () async {
                                  await controller.uploadPdf();
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      QTextField(
                        label: "Deskripsi",
                        validator: Validator.required,
                        value: null,
                        maxLines: 4,
                        maxLength: 255,
                        horizontal: 20,
                        vertical: 20,
                        onChanged: (value) {
                          state.description = value;
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            bottomNavigationBar: Padding(
              padding: EdgeInsets.all(8.0),
              child: QButton(
                label: "Publish",
                onPressed: () {
                  bool isNotValid = formKey.currentState!.validate() == false;
                  if (isNotValid) {
                    return;
                  }
                  controller.publish();
                },
              ),
            ),
          );
  }
}

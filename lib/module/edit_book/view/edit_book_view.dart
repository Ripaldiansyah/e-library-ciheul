import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core.dart';
import '../controller/edit_book_controller.dart';
import '../state/edit_book_state.dart';
import 'package:get_it/get_it.dart';

class EditBookView extends StatefulWidget {
  const EditBookView({super.key});

  @override
  State<EditBookView> createState() => _EditBookViewState();
}

class _EditBookViewState extends State<EditBookView> {
  EditBookController controller = EditBookController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    if (GetIt.I.isRegistered<EditBookController>()) {
      GetIt.I.unregister<EditBookController>();
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
      child: BlocListener<EditBookController, EditBookState>(
        listener: (context, state) {},
        child: BlocBuilder<EditBookController, EditBookState>(
          builder: (context, state) {
            final bloc = context.read<EditBookController>();
            return buildView(context, bloc, state);
          },
        ),
      ),
    );
  }

  Widget buildView(
    BuildContext context,
    EditBookController controller,
    EditBookState state,
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

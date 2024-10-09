import 'package:e_library_ciheul/shared/widget/dropdown/QDropDown.dart';
import 'package:e_library_ciheul/shared/widget/file_picker/file_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core.dart';
import '../controller/upload_book_controller.dart';
import '../state/upload_book_state.dart';
import 'package:get_it/get_it.dart';

class UploadBookView extends StatefulWidget {
  const UploadBookView({super.key});

  @override
  State<UploadBookView> createState() => _UploadBookViewState();
}

class _UploadBookViewState extends State<UploadBookView> {
  UploadBookController controller = UploadBookController();

  @override
  void initState() {
    if (GetIt.I.isRegistered<UploadBookController>()) {
      GetIt.I.unregister<UploadBookController>();
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    QTextField(
                      label: "Judul Buku",
                      validator: Validator.required,
                      value: null,
                      onChanged: (value) {},
                    ),
                    QTextField(
                      label: "Nama Pengarang",
                      validator: Validator.required,
                      value: null,
                      onChanged: (value) {},
                    ),
                    QDropdownField(
                      label: "Kategori",
                      validator: Validator.required,
                      items: state.categories!,
                      onChanged: (value, label) {},
                    ),
                    Container(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: QTextField(
                              label: "Upload Buku",
                              validator: Validator.required,
                              value: null,
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
                                await controller.uploadBook();
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
                      horizontal: 20,
                      vertical: 20,
                      onChanged: (value) {},
                    ),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: Padding(
              padding: EdgeInsets.all(8.0),
              child: QButton(
                label: "Next",
                onPressed: () {
                  controller.getGategories();
                },
              ),
            ),
          );
  }
}

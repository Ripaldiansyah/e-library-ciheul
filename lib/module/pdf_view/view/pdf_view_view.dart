import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import '../controller/pdf_view_controller.dart';
import '../state/pdf_view_state.dart';
import 'package:get_it/get_it.dart';

class PdfViewView extends StatefulWidget {
  const PdfViewView({
    super.key,
    required this.pathPdf,
  });

  final String pathPdf;
  @override
  State<PdfViewView> createState() => _PdfViewViewState();
}

class _PdfViewViewState extends State<PdfViewView> {
  PdfViewController controller = PdfViewController();

  @override
  void initState() {
    if (GetIt.I.isRegistered<PdfViewController>()) {
      GetIt.I.unregister<PdfViewController>();
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
      child: BlocListener<PdfViewController, PdfViewState>(
        listener: (context, state) {},
        child: BlocBuilder<PdfViewController, PdfViewState>(
          builder: (context, state) {
            final bloc = context.read<PdfViewController>();
            return buildView(context, bloc, state);
          },
        ),
      ),
    );
  }

  Widget buildView(
    BuildContext context,
    PdfViewController controller,
    PdfViewState state,
  ) {
    var spfd = widget.pathPdf.contains("assets/dummy_books")
        ? SfPdfViewer.asset(widget.pathPdf)
        : SfPdfViewer.file(File(widget.pathPdf));

    return SafeArea(
      child: Scaffold(
        body: spfd,
      ),
    );
  }
}

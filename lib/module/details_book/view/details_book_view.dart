import 'dart:io';

import 'package:e_library_ciheul/module/details_book/widget/more_text.dart';
import 'package:e_library_ciheul/shared/theme/theme_config.dart';
import 'package:e_library_ciheul/shared/widget/button/QButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../controller/details_book_controller.dart';
import '../state/details_book_state.dart';
import 'package:get_it/get_it.dart';

class DetailsBookView extends StatefulWidget {
  const DetailsBookView({
    super.key,
    required this.book,
    this.fetchData,
  });

  final book;
  final Function()? fetchData;
  @override
  State<DetailsBookView> createState() => _DetailsBookViewState();
}

class _DetailsBookViewState extends State<DetailsBookView> {
  DetailsBookController controller = DetailsBookController();

  @override
  void initState() {
    if (GetIt.I.isRegistered<DetailsBookController>()) {
      GetIt.I.unregister<DetailsBookController>();
    }
    GetIt.I.registerSingleton(controller);
    controller.initState();

    WidgetsBinding.instance.addPostFrameCallback(
      (_) => controller.checkFavorite(widget.book.id),
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
      child: BlocListener<DetailsBookController, DetailsBookState>(
        listener: (context, state) {},
        child: BlocBuilder<DetailsBookController, DetailsBookState>(
          builder: (context, state) {
            final bloc = context.read<DetailsBookController>();
            return buildView(context, bloc, state);
          },
        ),
      ),
    );
  }

  Widget buildView(
    BuildContext context,
    DetailsBookController controller,
    DetailsBookState state,
  ) {
    ImageProvider<Object> image =
        widget.book.coverPath.contains('assets/dummy_books')
            ? AssetImage(
                widget.book.coverPath,
              )
            : FileImage(
                File(widget.book.coverPath),
              );

    return state.isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Scaffold(
            appBar: AppBar(
              title: Text(
                'Details Book ${widget.book.title}',
              ),
            ),
            body: SingleChildScrollView(
              controller: ScrollController(),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height / 2.4,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: image,
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            8.0,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                "${widget.book.title}",
                                style: TextStyle(
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                controller.handleFavorite(widget.book.id);
                              },
                              icon: Icon(
                                state.isFavorite
                                    ? Icons.favorite
                                    : Icons.favorite_outline,
                                size: 24.0,
                                color: primaryColor,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                controller.editBook(
                                  widget.book,
                                  widget.fetchData,
                                );
                              },
                              icon: Icon(
                                Icons.edit,
                                size: 24.0,
                                color: Colors.grey,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                controller.deleteBook(widget.book.id);
                                widget.fetchData ?? ();
                              },
                              icon: Icon(
                                Icons.delete,
                                size: 24.0,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "${widget.book.author}",
                          style: TextStyle(
                            fontSize: 15.0,
                          ),
                        ),
                        Divider(),
                        Text(
                          "Sinopsis",
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        MoreText(
                          text: "${widget.book.description}",
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: Padding(
              padding: EdgeInsets.all(8.0),
              child: QButton(
                label: "Buka PDF",
                onPressed: () {
                  controller.openPdf(widget.book.pdfPath);
                },
              ),
            ),
          );
  }
}

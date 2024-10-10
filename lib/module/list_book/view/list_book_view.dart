import 'dart:io';

import 'package:e_library_ciheul/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../controller/list_book_controller.dart';
import '../state/list_book_state.dart';
import 'package:get_it/get_it.dart';

class ListBookView extends StatefulWidget {
  const ListBookView({
    super.key,
    required this.categories,
  });

  final categories;

  @override
  State<ListBookView> createState() => _ListBookViewState();
}

class _ListBookViewState extends State<ListBookView> {
  ListBookController controller = ListBookController();

  @override
  void initState() {
    if (GetIt.I.isRegistered<ListBookController>()) {
      GetIt.I.unregister<ListBookController>();
    }
    GetIt.I.registerSingleton(controller);
    controller.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => fetchData(),
    );
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  fetchData() async {
    await controller.getBookByCategoryId(widget.categories.id);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => controller,
      child: BlocListener<ListBookController, ListBookState>(
        listener: (context, state) {},
        child: BlocBuilder<ListBookController, ListBookState>(
          builder: (context, state) {
            final bloc = context.read<ListBookController>();
            return buildView(context, bloc, state);
          },
        ),
      ),
    );
  }

  Widget buildView(
    BuildContext context,
    ListBookController controller,
    ListBookState state,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.categories.label}"),
      ),
      body: state.isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : state.filteredBookByCategory!.length == 0
              ? Center(
                  child: Text(
                    "Tidak ada buku pada \n kategori ${widget.categories.label}",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                )
              : SingleChildScrollView(
                  controller: ScrollController(),
                  child: Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GridView.builder(
                          padding: EdgeInsets.zero,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 0.6,
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                          ),
                          itemCount: state.filteredBookByCategory?.length,
                          shrinkWrap: true,
                          physics: const ScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            var book = state.filteredBookByCategory?[index];
                            var image = book.coverPath
                                    .contains('assets/dummy_books')
                                ? Image.asset(
                                    book.coverPath,
                                    width: MediaQuery.of(context).size.width,
                                    fit: BoxFit.cover,
                                  )
                                : Image.file(
                                    File(book.coverPath),
                                    fit: BoxFit.cover,
                                    width: MediaQuery.of(context).size.width,
                                  );

                            return InkWell(
                              onTap: () {
                                controller.detailBook(book, fetchData);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 2.0,
                                    color: Colors.grey[900]!,
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: image,
                                    ),
                                    Text(
                                      "${book.title} ",
                                      style: TextStyle(
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.bold,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    Text(
                                      "${book.author} ",
                                      style: TextStyle(
                                        fontSize: 12.0,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
    );
  }
}

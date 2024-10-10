import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../controller/favorite_book_controller.dart';
import '../state/favorite_book_state.dart';
import 'package:get_it/get_it.dart';

class FavoriteBookView extends StatefulWidget {
  const FavoriteBookView({super.key});

  @override
  State<FavoriteBookView> createState() => _FavoriteBookViewState();
}

class _FavoriteBookViewState extends State<FavoriteBookView> {
  FavoriteBookController controller = FavoriteBookController();

  @override
  void initState() {
    if (GetIt.I.isRegistered<FavoriteBookController>()) {
      GetIt.I.unregister<FavoriteBookController>();
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
      child: BlocListener<FavoriteBookController, FavoriteBookState>(
        listener: (context, state) {},
        child: BlocBuilder<FavoriteBookController, FavoriteBookState>(
          builder: (context, state) {
            final bloc = context.read<FavoriteBookController>();
            return buildView(context, bloc, state);
          },
        ),
      ),
    );
  }

  Widget buildView(
    BuildContext context,
    FavoriteBookController controller,
    FavoriteBookState state,
  ) {
    controller.getFavoriteBook();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Book'),
      ),
      body: state.isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : state.books!.length == 0
              ? Center(
                  child: Text(
                    "Tidak ada buku Favorite",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                )
              : ListView.builder(
                  itemCount: state.books?.length,
                  physics: const ScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    var item = state.books![index];
                    ImageProvider<Object> image =
                        item.coverPath.contains('assets/dummy_books')
                            ? AssetImage(
                                item.coverPath,
                              )
                            : FileImage(
                                File(item.coverPath),
                              );
                    return Card(
                      child: InkWell(
                        onTap: () {
                          controller.detailBook(item);
                        },
                        child: ListTile(
                          leading: CircleAvatar(
                              backgroundColor: Colors.grey[200],
                              backgroundImage: image),
                          title: Text(item.title),
                          subtitle: Text("${item.author}"),
                        ),
                      ),
                    );
                  },
                ),
    );
  }
}

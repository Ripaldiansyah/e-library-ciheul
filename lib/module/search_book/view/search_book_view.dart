import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core.dart';
import '../controller/search_book_controller.dart';
import '../state/search_book_state.dart';
import 'package:get_it/get_it.dart';

class SearchBookView extends StatefulWidget {
  const SearchBookView({super.key});

  @override
  State<SearchBookView> createState() => _SearchBookViewState();
}

class _SearchBookViewState extends State<SearchBookView> {
  SearchBookController controller = SearchBookController();

  @override
  void initState() {
    if (GetIt.I.isRegistered<SearchBookController>()) {
      GetIt.I.unregister<SearchBookController>();
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
      child: BlocListener<SearchBookController, SearchBookState>(
        listener: (context, state) {},
        child: BlocBuilder<SearchBookController, SearchBookState>(
          builder: (context, state) {
            final bloc = context.read<SearchBookController>();
            return buildView(context, bloc, state);
          },
        ),
      ),
    );
  }

  Widget buildView(
    BuildContext context,
    SearchBookController controller,
    SearchBookState state,
  ) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      blurRadius: 5.0,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(
                        color: Colors.grey[300]!,
                      ),
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                  ),
                  onChanged: (value) async {
                    List<Books> results = await controller.searchBook(value);
                    controller.emitType(value, results);
                  },
                ),
              ),
              if (state.textTyped != null && state.textTyped != "")
                Expanded(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      itemCount: state.books?.length,
                      shrinkWrap: true,
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
                              controller.emitType(null, []);
                            },
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundColor: Colors.grey[200],
                                backgroundImage: image,
                              ),
                              title: Text(item.title),
                              subtitle: Text("${item.author}"),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

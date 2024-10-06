
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      appBar: AppBar(
        title: const Text('Search Book'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Counter: ${state.counter}',
            style: const TextStyle(fontSize: 24),
          ),
          IconButton(
            onPressed: () => controller.increment(),
            icon: const Icon(
              Icons.add,
              size: 24.0,
            ),
          ),
        ],
      ),
    );
  }
}
    
    
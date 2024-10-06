import 'package:e_library_ciheul/shared/util/show_snackbar/show_snackbar.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Book'),
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
            onPressed: () => snackbarDanger(message: "Password salah"),
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

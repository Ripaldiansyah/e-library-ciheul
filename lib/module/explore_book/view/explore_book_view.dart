import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../controller/explore_book_controller.dart';
import '../state/explore_book_state.dart';
import 'package:get_it/get_it.dart';

class ExploreBookView extends StatefulWidget {
  const ExploreBookView({super.key});

  @override
  State<ExploreBookView> createState() => _ExploreBookViewState();
}

class _ExploreBookViewState extends State<ExploreBookView> {
  ExploreBookController controller = ExploreBookController();

  @override
  void initState() {
    if (GetIt.I.isRegistered<ExploreBookController>()) {
      GetIt.I.unregister<ExploreBookController>();
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
      child: BlocListener<ExploreBookController, ExploreBookState>(
        listener: (context, state) {},
        child: BlocBuilder<ExploreBookController, ExploreBookState>(
          builder: (context, state) {
            final bloc = context.read<ExploreBookController>();
            return buildView(context, bloc, state);
          },
        ),
      ),
    );
  }

  Widget buildView(
    BuildContext context,
    ExploreBookController controller,
    ExploreBookState state,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Explore Book'),
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

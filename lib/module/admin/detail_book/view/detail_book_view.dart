
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../controller/detail_book_controller.dart';
import '../state/detail_book_state.dart';
import 'package:get_it/get_it.dart';

class DetailBookView extends StatefulWidget {
  const DetailBookView({super.key});

  @override
  State<DetailBookView> createState() => _DetailBookViewState();
}

class _DetailBookViewState extends State<DetailBookView> {
  DetailBookController controller = DetailBookController();

  @override
  void initState() {
    if (GetIt.I.isRegistered<DetailBookController>()) {
      GetIt.I.unregister<DetailBookController>();
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
      child: BlocListener<DetailBookController, DetailBookState>(
        listener: (context, state) {},
        child: BlocBuilder<DetailBookController, DetailBookState>(
          builder: (context, state) {
            final bloc = context.read<DetailBookController>();
            return buildView(context, bloc, state);
          },
        ),
      ),
    );
  }

  Widget buildView(
    BuildContext context,
    DetailBookController controller,
    DetailBookState state,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Book'),
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
    
    
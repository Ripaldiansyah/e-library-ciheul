
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upload Book'),
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
    
    